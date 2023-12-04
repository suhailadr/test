// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'app_text.dart';

class AppListTile extends StatelessWidget {
  final IconData? icon;
  final List<String> titles;
  const AppListTile({
    this.icon,
    required this.titles,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.blueSapphire,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...titles
              .map((text) => AppText(
                    text,
                    size: 10,
                    color: AppColors.blueSapphire,
                  ))
              .toList(),
          const Divider()
        ],
      ),
    );
  }
}

class TileModel {
  final IconData icon;
  final List<String> texts;
  TileModel({required this.icon, required this.texts});
}
