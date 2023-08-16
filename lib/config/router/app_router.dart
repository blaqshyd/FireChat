import 'package:flutter/material.dart';

class AppRouter {
  //? Use this in the main.dart file as navigatorKey
  static final navigatorKey = GlobalKey<NavigatorState>();

  //! push

  Future<T?> push<T>(Widget child) => Navigator.of(navigatorKey.currentContext!)
      .push(MaterialPageRoute(builder: (context) => child));

  //! pushReplacement

  Future<T?> pushReplacement<T>(Widget child) =>
      Navigator.of(navigatorKey.currentContext!)
          .pushReplacement(MaterialPageRoute(builder: (context) => child));

  //! pushRemoveUntil

  Future<void> pushAndRemoveUntil(Widget child) =>
      Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => child), (c) => false);

  //! pop

  void pop<T>() => Navigator.of(navigatorKey.currentContext!).pop();
}
