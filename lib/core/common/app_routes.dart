import 'package:flutter/material.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static void push(page) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static void pop() {
    navigatorKey.currentState?.pop();
  }

  static void pushReplace(page) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static void pushRemoveUntil(page) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }
}
