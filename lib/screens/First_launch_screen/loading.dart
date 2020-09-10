import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qlaw/styles.dart';
import 'package:qlaw/models/schools.dart';
import 'package:qlaw/models/Levels.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          alignment: Alignment.center,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      )
    );
  }

}

