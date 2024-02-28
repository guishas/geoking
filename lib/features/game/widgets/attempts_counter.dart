import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/features/game/bloc/game_bloc.dart';

class AttemptsCounter extends StatelessWidget {
  const AttemptsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final attempts = context.select((GameBloc bloc) => bloc.state.attempts);

    return Text(
      'Attempts: $attempts',
      textAlign: TextAlign.center,
      style: const TextStyle(
        height: 1.2,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
