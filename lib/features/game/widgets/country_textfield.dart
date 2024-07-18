import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/features/game/bloc/game_bloc.dart';

class CountryTextField extends StatefulWidget {
  const CountryTextField({super.key});

  @override
  State<CountryTextField> createState() => _CountryTextFieldState();
}

class _CountryTextFieldState extends State<CountryTextField> {
  final TextEditingController countryController = TextEditingController();
  final FocusNode countryFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final countryFound = context.select((GameBloc bloc) => bloc.state.foundSecretCountry);

    return TextFormField(
      enabled: !countryFound,
      focusNode: countryFocus,
      onFieldSubmitted: (value) {
        countryController.clear();
        context.read<GameBloc>().add(GameCountrySubmitted(country: value));
        FocusScope.of(context).requestFocus(countryFocus);
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: countryController,
      decoration: const InputDecoration(
        hintText: 'Type a country',
        contentPadding: EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      cursorColor: Colors.black,
      cursorHeight: 16,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
      ],
    );
  }
}
