import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final bool scrolling;
  final Color backgroudColor;
  const CustomScaffold(
      {super.key,
      required this.body,
      this.appBar,
      this.scrolling = false,
      this.backgroudColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,
      appBar: appBar,
      body: scrolling
          ? SingleChildScrollView(
              child: body,
            )
          : body,
    );
  }
}
