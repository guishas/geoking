import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/features/game/bloc/game_bloc.dart';

class CountryTextField extends StatelessWidget {
  const CountryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;

    return TextFormField(
      onChanged: (value) {
        context.read<GameBloc>().add(GameCountryChanged(country: value));
      },
      initialValue: state.country,
      decoration: const InputDecoration(
        hintText: 'Type a country',
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
      ],
    );
  }
}
