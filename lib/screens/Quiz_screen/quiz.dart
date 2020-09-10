
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qlaw/styles.dart';
import 'package:qlaw/models/question.dart';
import 'package:qlaw/screens/Results_dialog/results.dart';
import 'dart:math';


class Quiz extends StatefulWidget {

  final int numberOfQuestions;

  Quiz({
    Key key,
    this.numberOfQuestions,
  }) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with TickerProviderStateMixin {

  AnimationController _flipController;
  Animation<double> _flipAnimation;
  AnimationStatus _flipAnimationStatus = AnimationStatus.dismissed;

  String _questionText = Questions[1].questionTxt;
  String _answerA = Questions[1].answerATxt;
  String _answerB = Questions[1].answerBTxt;
  String _answerC = Questions[1].answerCTxt;
  String _answerD = Questions[1].answerDTxt;

  int _correctAnsw = Questions[1].correctAnsw;

  Color  _color;
  int _questionCounter = 1;
  int _playerScore = 0;
  var _usedIndex = new List<int>();

  @override
  void initState() {
    super.initState();
    _color = Colors.white;
    _flipController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _flipAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(_flipController)
      ..addListener(() {
        setState(() {
        });
      })
      ..addStatusListener((status) {
        _flipAnimationStatus = status;
      });
    getRandomUniqueQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Stack(children: [
        //BACKGROUND
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 0.9],
          colors: [Colors.white, pColorBG],
        ))),

        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),

                //HEADER
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          iconSize: 30,
                          color: Colors.grey,
                          icon: Icon(Icons.menu),
                          onPressed: () {Navigator.of(context).pop();}),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "$_questionCounter/${widget.numberOfQuestions}",
                          style: QuizHeader,
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                            iconSize: 30,
                            color: Colors.redAccent,
                            icon: Icon(Icons.feedback),
                            onPressed: () {}),
                      ]),
                    ]),

                //QUESTION
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Transform(
                        alignment: FractionalOffset.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.002)
                          ..rotateX(pi * _flipAnimation.value),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2.0, color: Colors.grey),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                            ),
                            child: Stack(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, right: 15),
                                    child: Icon(
                                        Icons.verified_user,
                                        size: 30,
                                        color: Colors.green,
                                        
                                        ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Text(
                                  '$_questionText',
                                  style: QuizQuestion,
                                ),
                              )
                            ])),
                      )),
                ),

                //ANSWERS
                SafeArea(
                  child: Container(
                    // color: Colors.amber,
                    height: MediaQuery.of(context).size.height * 0.44,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //ANSWER A
                        Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 65,
                            child: RaisedButton(
                              onPressed: () => _answerClicked(context, 1),
                              child: Text(
                                '$_answerA',
                                style: QuizAnsw,
                              ),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                        ),

                        //ANSWER B
                        Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 65,
                            child: RaisedButton(
                              onPressed: () => _answerClicked(context, 2),
                              child: Text(
                                '$_answerB',
                                style: QuizAnsw,
                              ),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                        ),

                        //ANSWER C
                        Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 65,
                            child: RaisedButton(
                              onPressed: () => _answerClicked(context, 3),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                color: _color,
                                child: Text(
                                  '$_answerC',
                                  style: QuizAnsw,
                                ),
                              ),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                        ),

                        //ANSWER D
                        Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 65,
                            child: RaisedButton(
                              onPressed: () => _answerClicked(context, 4),
                              child: Text(
                                '$_answerD',
                                style: QuizAnsw,
                              ),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ]),
        )
      ]),
    );
  }

  _answerClicked(context, answer){
    
    if(_correctAnsw == answer) {
      _color = Colors.green;
      _playerScore ++;
    } else {
      _color = Colors.redAccent;
    }

    if (_questionCounter == widget.numberOfQuestions) {
      showResult(context);

    } else {
      getRandomUniqueQuestion();
      
      setState(() {
        _flipController.forward(from: 0.0);
        _questionCounter ++;
      });
    }
  }

  void showResult(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => ResultsDialog(
        score: _playerScore,
        numberOfQuestions: widget.numberOfQuestions,
        exp: 100,
        expGain: 65,
        lvl: 1,
      ),
    );
  }

  void getRandomUniqueQuestion() {
    var random = new Random();
    int randomIndex = random.nextInt(Questions.length-1);
    
    while(_usedIndex.contains(randomIndex)) {
      randomIndex = random.nextInt(Questions.length-1);
    }

    _usedIndex.add(randomIndex);
    if(_questionCounter == 1) {
      _questionText = Questions[randomIndex].questionTxt;
    } else {
      Future.delayed(Duration(milliseconds: 225), () {
        _questionText = Questions[randomIndex].questionTxt;
      });
    }
    _answerA = Questions[randomIndex].answerATxt;
    _answerB = Questions[randomIndex].answerBTxt;
    _answerC = Questions[randomIndex].answerCTxt;
    _answerD = Questions[randomIndex].answerDTxt;
    _correctAnsw = Questions[randomIndex].correctAnsw;
  }
}



