import 'package:flutter/material.dart';
import 'package:technaureus/core/utils/app_colors.dart';

class HomeBox extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final Function()? onTap;
  const HomeBox({super.key, this.icon, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey.shade300)],
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: AppColors.appBlue,
              ),
              Text(
                title!,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
