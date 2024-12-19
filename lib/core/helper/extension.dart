import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> push(screen) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Future<dynamic> pushReplacement(screen) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Future<dynamic> pushAndRemoveUntil(screen,
      {required RoutePredicate predicate}) {
    return Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        predicate);
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this, rootNavigator: true).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this, rootNavigator: true)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
