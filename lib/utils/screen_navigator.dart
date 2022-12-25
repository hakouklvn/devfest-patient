import 'package:flutter/material.dart';

class ScreenService {
  static void resetRoute(context) {
    return Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  static void replaceWith(context, screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static void goto(context, screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, _) => screen,
      ),
    );
  }

  static void goBack(context) {
    Navigator.of(context).pop();
  }
}
