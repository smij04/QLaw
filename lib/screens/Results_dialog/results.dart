
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qlaw/models/Levels.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:ui';

import 'package:qlaw/styles.dart';
import 'package:qlaw/screens/Results_dialog/indicator_animation.dart';
import 'package:qlaw/screens/Results_dialog/Level_up_animation.dart';

class ResultsDialog extends StatefulWidget {
  final int score, numberOfQuestions, exp, expGain, lvl;

  ResultsDialog({
    Key key,
    this.score,
    this.numberOfQuestions, 
    this.exp, 
    this.expGain, 
    this.lvl}): super(key: key);

  

  @override
  _ResultsDialogState createState() => _ResultsDialogState();
}

class _ResultsDialogState extends State<ResultsDialog> {

  int _lvl;
  int  _curLevelExpNeeded;
  int  _nextLevelExpNeeded;

  @override
  void initState() {
    _lvl = widget.lvl;
    _curLevelExpNeeded = Levels[_lvl-1].exp;
    _nextLevelExpNeeded = Levels[_lvl].exp;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      child:AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: EdgeInsets.zero,
        content:  _dialogContent(widget.score,widget.numberOfQuestions,widget.exp,widget.expGain,_lvl,_curLevelExpNeeded,_nextLevelExpNeeded),
      ),
    );
  }
}

Widget _dialogContent(score,numberOfQuestions,exp,expGain,lvl,curLevelExpNeeded,nextLevelExpNeeded) {

  int _score = score;
  int _numQuestions = numberOfQuestions;
  int _exp = exp;
  int _expGain = expGain;
  int _lvl = lvl;
  double _acc = _score / _numQuestions * 100;
  int _totalExp = _exp + _expGain;
  double _isLevelUp = 0.0;
  int  _curLevelExpNeeded = curLevelExpNeeded;
  int  _nextLevelExpNeeded = nextLevelExpNeeded;

  if (_totalExp > _curLevelExpNeeded) {
    _isLevelUp = 1.0;
  }

  
  return Stack(
    overflow: Overflow.visible,
    alignment: Alignment.topCenter,
    children: [

      //MAIN BODY
      Container(
        height: 450,
        width: 270,
        child: Column (
          children: [
            SizedBox(
              height: 70,
            ),
            
            //INFO
            Row(
              children: [
                SizedBox(
                  width: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7,bottom: 7),
                        child: ControlledAnimation(
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: (300 * 2).round()),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, animation) {
                            return Opacity(
                              opacity: animation,
                              child: Text(
                                'Spráně:',
                                style: ResultsTxt,
                              ),
                            );
                          }
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7,bottom: 7),
                        child: ControlledAnimation(
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: (300 * 3).round()),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, animation) {
                            return Opacity(
                              opacity: animation,
                              child: Text(
                                'Úspěšnost:',
                                style: ResultsTxt,
                              ),
                            );
                          }
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7,bottom: 7),
                        child: ControlledAnimation(
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: (300 * 4).round()),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, animation) {
                            return Opacity(
                              opacity: animation,
                              child: Text(
                                'Zkušenosti:',
                                style: ResultsTxt,
                              ),
                            );
                          }
                        )
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 30,
                ),

                SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7,bottom: 7),
                        child: ControlledAnimation(
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: (300 * 2).round()),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, animation) {
                            return Opacity(
                              opacity: animation,
                              child: Text(
                                '$_score/$_numQuestions',
                                style: ResultsTxt,
                              ),
                            );
                          }
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7,bottom: 7),
                        child: ControlledAnimation(
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: (300 * 3).round()),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, animation) {
                            return Opacity(
                              opacity: animation,
                              child: Text(
                                '$_acc %',
                                style: ResultsTxt,
                              ),
                            );
                          }
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7,bottom: 7),
                        child: ControlledAnimation(
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: (300 * 4).round()),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, animation) {
                            return Opacity(
                              opacity: animation,
                              child: Text(
                                '+ $_expGain',
                                style: ResultsTxt,
                              ),
                            );
                          }
                        )
                      ),
                    ],
                  ),
                ),

              ],
            ),

            //EXP BAR
            new IndicatorDemo(
            curExp: _exp,
            gainExp: _expGain,
            finalExp: _totalExp,
            curLvlExp: _curLevelExpNeeded,
            nextLvlExp: _nextLevelExpNeeded,
            ),
            

            //UROVEN
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ControlledAnimation(
                    duration: Duration(milliseconds: 1000),
                    delay: Duration(milliseconds: (300 * 19).round()),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, animation) {
                      return Opacity(
                        opacity: animation,
                        child: Text(
                          'Úroveň',
                          style: ResultsTxt,
                        ),
                      );
                    },
                  ),

                  ControlledAnimation(
                    duration: Duration(milliseconds: 1000),
                    delay: Duration(milliseconds: (300 * 20).round()),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, animation) {
                      return Opacity(
                        opacity: animation,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  '$_lvl',
                                  style: ResultsLevel,
                                ),
                              ),

                              Opacity(
                                opacity: _isLevelUp,
                                child: LevelUpArrowAnimation(),
                              ),
                              
                            ]
                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          
            //ICON BUTTONS
            ControlledAnimation(
              duration: Duration(milliseconds: 1000),
              delay: Duration(milliseconds: (300 * 22).round()),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, animation) {
                return Opacity(
                  opacity: animation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: IconButton(
                          iconSize: 45,
                          color: Colors.grey,
                          icon: Icon(Icons.menu),
                          onPressed: () {Navigator.of(context).pushNamed('/menu');}
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: IconButton(
                          iconSize: 45,
                          color: Colors.grey,
                          icon: Icon(Icons.refresh),
                          onPressed: () {Navigator.of(context).pushNamed('/quiz', arguments: 10);}
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      
      //HEADER LOGO
      Positioned(
        top: -50,
        child: Stack(
        alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
            ),
            ControlledAnimation(
              duration: Duration(milliseconds: 1400),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, animation) {
                return Opacity(
                  opacity: animation,
                  child: Icon(
                    Icons.check_circle,
                    size: 100,
                    color: btnColor,
                  ),
                );
              }
            )
          ]
        )
            
      ),
      
    ],
  );
}


