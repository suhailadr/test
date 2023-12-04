import 'package:flutter/material.dart';
import 'package:technaureus/core/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double fontSize;
  const AppButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = AppColors.red,
    this.textColor = AppColors.white,
    this.width = double.infinity,
    this.height = 13,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.symmetric(
              vertical: height,
            ),
            elevation: 0,
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                letterSpacing: 1,
                fontWeight: FontWeight.w700),
          ),
        ),
      );
}
