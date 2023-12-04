import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    Key? key,
    required this.height,
    this.width = double.infinity,
    this.radius = 10,
    this.color = Colors.white,
  }) : super(key: key);
  final double height;
  final double width;
  final double radius;
  final Color color;
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade400,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      );
}
