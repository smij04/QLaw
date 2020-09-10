import 'package:flutter/material.dart';
import 'package:qlaw/screens/First_launch_screen/start.dart';
import 'package:qlaw/screens/Quiz_screen/quiz.dart';
import 'screens/First_launch_screen/first_start.dart';
import 'screens/Menu_screen/menu.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Start());
      case '/first_launch':
        return MaterialPageRoute(builder: (_) => FirstStart());
      case '/menu':
        return MaterialPageRoute(builder: (_) => Menu());
      case '/quiz':
        return MaterialPageRoute(builder: (_) => Quiz(
          numberOfQuestions: args,
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
