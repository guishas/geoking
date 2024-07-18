import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/features/game/bloc/game_bloc.dart';

class CountryMessage extends StatelessWidget {
  const CountryMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state.foundSecretCountry) {
          return Text(
            'Congratulations! The secret country was ${state.secretCountry!.name!.common!}!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          );
        } else if (state.countryExists) {
          final country = state.lastFoundCountry!;

          return Text(
            '${country.name!.common!} is ${country.distance} km away from the secret country.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          if (state.lastTypedCountry == null) {
            return const SizedBox.shrink();
          }

          return Text(
            '${state.lastTypedCountry} doesn\'t exist.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          );
        }
      },
    );
  }
}
