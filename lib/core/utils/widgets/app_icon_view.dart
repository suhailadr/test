import 'package:flutter/material.dart';

class AppIconView extends StatelessWidget {
  final String icon;
  final double? size;
  const AppIconView({super.key, required this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      height: size ?? 20,
      width: size ?? 20,
    );
  }
}
