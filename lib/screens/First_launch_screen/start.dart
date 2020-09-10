import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qlaw/screens/First_launch_screen/first_start.dart';
import 'package:qlaw/screens/First_launch_screen/loading.dart';
import 'package:qlaw/screens/Menu_screen/menu.dart';
import 'package:qlaw/styles.dart';
import 'package:qlaw/models/schools.dart';
import 'package:qlaw/models/Levels.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Start extends StatelessWidget {
  const Start({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Loading();
          default:
            if (!snapshot.hasError) {
              return snapshot.data.getString('username') != null
                  ? new Menu()
                  : new FirstStart();
            } else {
              return Scaffold(
                body: Center(
                  child: Text('ERROR FIRST START'),
                ),
              );
            }
        }
      },
    );
  }
}