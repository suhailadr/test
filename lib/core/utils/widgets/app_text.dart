import 'package:flutter/material.dart';
import 'package:technaureus/core/utils/app_colors.dart';

class AppText extends Text {
  AppText(
    super.data, {
    Key? key,
    TextOverflow? overflow,
    double size = 14,
    Color color = AppColors.black,
    FontWeight bold = FontWeight.w400,
    TextAlign align = TextAlign.center,
  }) : super(
          key: key,
          style: TextStyle(
            color: color,
            fontSize: size,
            wordSpacing: 1,
            fontWeight: bold,
            overflow: overflow,
          ),
          textAlign: align,
        );
}
