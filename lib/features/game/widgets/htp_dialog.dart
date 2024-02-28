import 'package:flutter/material.dart';
import 'package:geoking/common/colors.dart';

class HowToPlayDialog extends StatelessWidget {
  const HowToPlayDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.mainLightGreen,
              AppColors.mainOceanBlue,
            ],
          ),
        ),
        child: const Text(
          'A country will be randomly selected from a list of 235 world countries. Not all countries in the world are included.\n\nYour job is to guess the secret country. Your attempts are unlimited. If your guess isn\'t the secret country, we will show you how far away your guess is from the secret country. Use your geography skills to find the secret country.\n\nGood luck!',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
