import 'package:flutter/material.dart';
import 'screens/first_start.dart';


const LocationsRoute = '/';


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),     
      theme: _theme(),
    );
  }


  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = FirstStart();
          break;

        default:
          return null;
      }

      return MaterialPageRoute(builder: (BuildContext context) => screen);

    };
  }

  ThemeData _theme() {

  }

}


