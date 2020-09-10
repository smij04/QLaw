import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:ui';

import 'package:qlaw/styles.dart';

class IndicatorAnimation extends StatelessWidget {

  final int curExp;
  final int gainExp;
  final int finalExp;
  final int curLvlExp;

  IndicatorAnimation({ 
    Key key,
    this.curExp,
    this.gainExp, 
    this.finalExp, 
    this.curLvlExp, 
    this.controller }) :

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.4, 0.55,
          curve: Curves.ease,
        ),
      ),
    ),

    
    indicator = Tween<double>(
      begin: curExp/curLvlExp,
      end: finalExp/curLvlExp,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1,
          curve: Curves.ease,
        ),
      ),
    ),

    text = Tween<double>(
      begin: curExp.toDouble(),
      end: finalExp.toDouble(),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1,
          curve: Curves.ease,
        ),
      ),
    ),

    super(key: key);

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> indicator;
  final Animation<double> text;


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }


  Widget _buildAnimation(BuildContext context, Widget child) {
    return Opacity(
      opacity: opacity.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 7),
            width: 170,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: .3, color: Colors.black),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: indicator.value,
                valueColor: new AlwaysStoppedAnimation<Color>(
                  expColor,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        
          Text(
            text.value.toStringAsFixed(0) + '/$curLvlExp',
            style: ResultsExp,
          )
        ],
      ),
    );

  }
}

class IndicatorLevelUpAnimation extends StatelessWidget {

  final int curExp;
  final int gainExp;
  final int finalExp;
  final int curLvlExp;
  final int nextLvlExp;

  IndicatorLevelUpAnimation({ 
    Key key,
    this.curExp,
    this.gainExp, 
    this.finalExp, 
    this.curLvlExp,
    this.nextLvlExp, 
    this.controller }) :

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.4, 0.55,
          curve: Curves.ease,
        ),
      ),
    ),

    
    indicatorEnd = Tween<double>(
      begin: curExp/curLvlExp,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 0.8,
          curve: Curves.ease,
        ),
      ),
    ),

    indicatorStart = Tween<double>(
      begin: 0.0,
      end: (finalExp-curLvlExp)/nextLvlExp,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.8, 1,
          curve: Curves.ease,
        ),
      ),
    ),

    text = Tween<double>(
      begin: curExp.toDouble(),
      end: finalExp.toDouble(),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1,
          curve: Curves.ease,
        ),
      ),
    ),

    super(key: key);

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> indicatorEnd;
  final Animation<double> indicatorStart;
  final Animation<double> text;


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }


  Widget _buildAnimation(BuildContext context, Widget child) {
    if (indicatorEnd.value != 1.0) {
      return Opacity(
        opacity: opacity.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 7),
              width: 170,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: .3, color: Colors.black),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  
                  value: indicatorEnd.value,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    expColor,
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          
            Text(
              text.value.toStringAsFixed(0) + '/$curLvlExp',
              style: ResultsExp,
            )
          ],
        ),
      );
    } else {
      return Opacity(
        opacity: opacity.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 7),
              width: 170,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: .3, color: Colors.black),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  
                  value: indicatorStart.value,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    expColor,
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          
            Text(
              text.value.toStringAsFixed(0) + '/$nextLvlExp',
              style: ResultsExp,
            )
          ],
        ),
      );
    }
    

  }
}


class IndicatorDemo extends StatefulWidget {

  final int curExp;
  final int gainExp;
  final int finalExp;
  final int curLvlExp;
  final int nextLvlExp;

  IndicatorDemo({
    Key key,
    this.curExp,
    this.gainExp, 
    this.finalExp, 
    this.curLvlExp, 
    this.nextLvlExp}): super(key: key);

  @override
  _IndicatorDemoState createState() => _IndicatorDemoState();
}

class _IndicatorDemoState extends State<IndicatorDemo> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 is normal animation speed.
    if (widget.finalExp <= widget.curLvlExp) {
      return IndicatorAnimation(
        curExp: widget.curExp,
        gainExp: widget.gainExp,
        finalExp: widget.finalExp, 
        curLvlExp: widget.curLvlExp,
        controller: _controller.view
      );
    } else {
      return IndicatorLevelUpAnimation(
        curExp: widget.curExp,
        gainExp: widget.gainExp,
        finalExp: widget.finalExp, 
        curLvlExp: widget.curLvlExp,
        nextLvlExp: widget.nextLvlExp,
        controller: _controller.view
      );
    }
    
  }
}