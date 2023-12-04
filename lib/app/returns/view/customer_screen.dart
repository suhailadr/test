import 'package:flutter/material.dart';
import 'package:technaureus/app/main_page/view/main_screen.dart';

class ReturnScreen extends StatelessWidget {
  const ReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        pageNotifier.value = 0;
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Text('Return Screen'),
        ),
      ),
    );
  }
}
