import 'package:flutter/material.dart';
import 'package:geoking/common/colors.dart';
import 'package:geoking/features/game/widgets/country_textfield.dart';
import 'package:geoking/features/game/widgets/util_buttons.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.mainOceanBlue,
              AppColors.mainLightGreen,
            ],
          ),
        ),
        child: const SafeArea(
          child: Column(
            children: [
              UtilButtons(),
              CountryTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
