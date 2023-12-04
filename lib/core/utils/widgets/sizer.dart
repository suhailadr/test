import 'package:flutter/material.dart';
import 'package:technaureus/core/utils/size_utils.dart';

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtil.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtil.deviceType);
      });
    });
  }
}
