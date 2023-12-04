import 'package:flutter/material.dart';
import 'package:technaureus/core/utils/app_colors.dart';

class AppTitle extends Text {
  AppTitle(
    super.data, {
    Key? key,
    TextOverflow? overflow,
    double fontSize = 16,
    Color color = AppColors.appBlue,
    TextAlign align = TextAlign.center,
    FontWeight weight = FontWeight.w700,
  }) : super(
          key: key,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: weight,
            wordSpacing: 0.8,
            overflow: overflow,
          ),
          textAlign: align,
        );
}
