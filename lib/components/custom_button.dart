import 'package:flutter/material.dart';
import 'package:geoking/common/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
    this.textAlign,
    this.height,
    this.maximumSize,
    this.padding,
  });

  final void Function()? onPressed;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? height;
  final Size? maximumSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: AppColors.homeButtonColor,
          maximumSize: maximumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextStyle(
            height: height,
            color: AppColors.mainLightGreen,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
