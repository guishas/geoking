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
          'A country will be randomly selected from a list of 180 countries.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
