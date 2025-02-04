import 'package:flutter/material.dart';

class RouteNavigator {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      // case '/home':
      //   return MaterialPageRoute(builder: (context) => HomePage());
      // case '/about':
      //   return MaterialPageRoute(builder: (context) => AboutPage());
      default:
        return null;
    }
  }
}