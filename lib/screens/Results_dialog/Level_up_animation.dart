import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LevelUpArrowAnimation extends StatefulWidget {
  

  @override
  _LevelUpArrowAnimationState createState() =>
      new _LevelUpArrowAnimationState();
}

class _LevelUpArrowAnimationState extends State<LevelUpArrowAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> topPadding;

  @override
  void initState() {
    super.initState();
      controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
      topPadding = Tween(begin: 7.0, end: 3.0).animate(controller)
        ..addListener(() {
          setState(() {
          });
        });
      controller.repeat();

    
  }


  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: topPadding.value, left: 40),
        child: Icon(
          Icons.arrow_upward,
          color: Colors.green,
          size: 20,
        ),
      ),
    );
    
  }

}