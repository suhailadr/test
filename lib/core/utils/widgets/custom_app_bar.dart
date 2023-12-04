import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technaureus/core/common/app_routes.dart';
import 'package:technaureus/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final void Function()? pop;
  const CustomAppBar({super.key, this.title, required this.pop});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      toolbarHeight: 80,
      leading: IconButton(
        icon: const Icon(
          CupertinoIcons.back,
          color: AppColors.appBlue,
        ),
        onPressed: pop,
      ),
      title: Center(
          child: Text(
        title!,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.menu,
            size: 25,
            color: AppColors.appBlue,
          ),
        )
      ],
    );
  }
}
