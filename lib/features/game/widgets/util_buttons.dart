import 'package:flutter/material.dart';
import 'package:geoking/components/custom_button.dart';
import 'package:geoking/features/game/widgets/htp_dialog.dart';

class UtilButtons extends StatelessWidget {
  const UtilButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'BACK',
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        CustomButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierColor: Colors.grey.shade700.withOpacity(0.5),
              builder: (context) {
                return const HowToPlayDialog();
              },
            );
          },
          text: 'HOW TO PLAY',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          maximumSize: const Size.fromWidth(120),
          maxLines: 2,
          textAlign: TextAlign.center,
          height: 1,
        ),
      ],
    );
  }
}
