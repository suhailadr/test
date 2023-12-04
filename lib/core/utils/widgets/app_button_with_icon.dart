import 'package:flutter/material.dart';
import 'package:technaureus/core/utils/app_colors.dart';
import 'package:technaureus/core/utils/size_extenstion.dart';
import 'package:technaureus/core/utils/widgets/app_text.dart';

class AppButtonWithIcon extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final double width;
  final Widget icon;
  final double height;
  final bool isRightIcon;
  final double textSize;
  const AppButtonWithIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.color = AppColors.red,
    this.width = double.infinity,
    this.height = 13,
    this.isRightIcon = false,
    this.textSize = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.5),
            ),
            padding: EdgeInsets.symmetric(vertical: height),
            elevation: 0,
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: isRightIcon ? TextDirection.rtl : null,
            children: [
              icon,
              5.width,
              AppText(
                text,
                color: AppColors.white,
                size: textSize,
              ),
            ],
          ),
        ),
      );
}
