import 'package:flutter/material.dart';
import 'package:technaureus/core/common/app_routes.dart';
import 'package:technaureus/core/utils/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    this.iconColor = AppColors.white,
  }) : super(key: key);
  final Color iconColor;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: AppRoute.pop,
        child: Card(
          shape: const CircleBorder(),
          color: AppColors.grey600,
          margin: const EdgeInsets.only(left: 15, top: 15),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.close,
              color: iconColor,
              size: 20,
            ),
          ),
        ),
      );
}
