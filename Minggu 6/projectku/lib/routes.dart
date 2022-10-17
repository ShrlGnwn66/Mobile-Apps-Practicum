import 'package:flutter/material.dart';
import 'package:projectku/secren.dart';
import 'package:projectku/scaffold.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argumen
    // final args = settings.argument;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutPage());
      case '/scaffold':
        return MaterialPageRoute(builder: (_) => ScaffoldPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text('Error page 404 Not Found'),
        ),
      );
    });
  }
}
