import 'package:flutter/material.dart';
import 'package:technaureus/core/utils/size_utils.dart';

extension SizeExtension on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
  SizedBox get respHeight =>
      SizedBox(height: (this * SizeUtil.height / 100).toDouble());
  SizedBox get respWidth =>
      SizedBox(width: (this * SizeUtil.width / 100).toDouble());
  double get h => (this * SizeUtil.height) / 100;
  double get w => (this * SizeUtil.width) / 100;
}
