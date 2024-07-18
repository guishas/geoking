import 'dart:developer' as developer;
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geoking/features/game/models/country.dart';
import 'package:geoking/features/game/repository/game_repository.dart';
import 'package:geoking/firebase/database_repository.dart';
import 'package:latlong2/latlong.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required this.gameRepository,
    required this.databaseRepository,
  }) : super(const GameState()) {
    on<GameSubscriptionRequested>(onSubscriptionRequested);
    on<GameCountrySubmitted>(onCountrySubmitted);
    on<GameNameSubmitted>(onGameNameSubmitted);
  }

  final GameRepository gameRepository;
  final DatabaseRepository databaseRepository;

  Future<void> onSubscriptionRequested(GameSubscriptionRequested event, Emitter<GameState> emit) async {
    emit(state.copyWith(status: GameStateStatus.loading));

    try {
      final countries = await gameRepository.fetchCountries();

      countries.removeWhere((country) => country.name!.common!.toLowerCase().contains('islands'));

      final secretCountry = countries.elementAt(Random().nextInt(countries.length));

      if (kDebugMode) {
        developer.log(secretCountry.name!.common!);
      }

      emit(state.copyWith(
        status: GameStateStatus.success,
        secretCountry: secretCountry,
        fetchedCountries: countries,
      ));
    } catch (e) {
      emit(state.copyWith(status: GameStateStatus.failure));
    }
  }

  void onCountrySubmitted(GameCountrySubmitted event, Emitter<GameState> emit) async {
    final submittedCountry = event.country.toLowerCase().trim();

    try {
      final country = state.fetchedCountries.singleWhere((c) {
        return c.name!.common!.toLowerCase() == submittedCountry || c.name!.official!.toLowerCase() == submittedCountry;
      });

      if (country.name!.common!.toLowerCase() == state.secretCountry!.name!.common!.toLowerCase() || country.name!.official!.toLowerCase() == state.secretCountry!.name!.official!.toLowerCase()) {
        final isHighscore = await databaseRepository.isHighscore(state.attempts + 1);

        emit(state.copyWith(
          isHighscore: isHighscore,
          foundSecretCountry: true,
          lastFoundCountry: country,
          countryExists: true,
        ));
      }

      final distanceInKm = const Distance().as(
        LengthUnit.Kilometer,
        LatLng(country.latlng![0], country.latlng![1]),
        LatLng(state.secretCountry!.latlng![0], state.secretCountry!.latlng![1]),
      );

      country.distance = distanceInKm.round();

      final submittedCountries = [...state.submittedCountries, country];
      submittedCountries.sort((a, b) => a.distance! - b.distance!);

      emit(state.copyWith(
        lastTypedCountry: event.country,
        countryExists: true,
        lastFoundCountry: country,
        submittedCountries: submittedCountries,
        attempts: state.attempts + 1,
      ));
    } on StateError {
      emit(state.copyWith(
        lastTypedCountry: event.country,
        countryExists: false,
      ));
    }
  }

  Future<void> onGameNameSubmitted(GameNameSubmitted event, Emitter<GameState> emit) async {
    emit(state.copyWith(highscoreStatus: GameHighscoreStatus.loading));

    final name = event.name;

    try {
      await databaseRepository.addScore(name, state.secretCountry!.name!.common!, state.attempts);

      emit(state.copyWith(
        highscoreStatus: GameHighscoreStatus.success,
        status: GameStateStatus.finished,
      ));
    } catch (e) {
      emit(state.copyWith(
        highscoreStatus: GameHighscoreStatus.failure,
      ));
    }
  }
}
