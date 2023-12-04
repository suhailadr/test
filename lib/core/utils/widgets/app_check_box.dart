import 'package:flutter/material.dart';
import 'package:technaureus/core/utils/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  const AppCheckBox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: AppColors.chineseSilver,
      ),
      child: Transform.scale(
        scale: .9,
        child: Checkbox(
            activeColor: AppColors.white,
            checkColor: AppColors.blueSapphire,
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(3)),
            value: value,
            onChanged: onChanged),
      ),
    );
  }
}
