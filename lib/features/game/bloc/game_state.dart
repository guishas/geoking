part of 'game_bloc.dart';

enum GameStateStatus {
  initial,
  loading,
  success,
  failure,
  finished,
}

enum GameHighscoreStatus {
  initial,
  loading,
  success,
  failure,
}

final class GameState extends Equatable {
  const GameState({
    this.status = GameStateStatus.initial,
    this.highscoreStatus = GameHighscoreStatus.initial,
    this.isHighscore = false,
    this.countryExists = false,
    this.foundSecretCountry = false,
    this.secretCountry,
    this.lastTypedCountry,
    this.lastFoundCountry,
    this.submittedCountries = const [],
    this.fetchedCountries = const [],
    this.attempts = 0,
  });

  final GameStateStatus status;
  final GameHighscoreStatus highscoreStatus;
  final bool isHighscore;
  final bool countryExists;
  final bool foundSecretCountry;
  final Country? secretCountry;
  final String? lastTypedCountry;
  final Country? lastFoundCountry;
  final List<Country> submittedCountries;
  final List<Country> fetchedCountries;
  final int attempts;

  GameState copyWith({
    GameStateStatus? status,
    GameHighscoreStatus? highscoreStatus,
    bool? isHighscore,
    bool? countryExists,
    bool? foundSecretCountry,
    Country? secretCountry,
    String? lastTypedCountry,
    Country? lastFoundCountry,
    List<Country>? submittedCountries,
    List<Country>? fetchedCountries,
    int? attempts,
  }) {
    return GameState(
      status: status ?? this.status,
      highscoreStatus: highscoreStatus ?? this.highscoreStatus,
      isHighscore: isHighscore ?? this.isHighscore,
      countryExists: countryExists ?? this.countryExists,
      foundSecretCountry: foundSecretCountry ?? this.foundSecretCountry,
      secretCountry: secretCountry ?? this.secretCountry,
      lastTypedCountry: lastTypedCountry ?? this.lastTypedCountry,
      lastFoundCountry: lastFoundCountry ?? this.lastFoundCountry,
      submittedCountries: submittedCountries ?? this.submittedCountries,
      fetchedCountries: fetchedCountries ?? this.fetchedCountries,
      attempts: attempts ?? this.attempts,
    );
  }

  @override
  List<Object?> get props => [status, highscoreStatus, isHighscore, countryExists, secretCountry, lastTypedCountry, lastFoundCountry, submittedCountries, fetchedCountries, attempts];
}
