import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qlaw/styles.dart';
import 'package:qlaw/models/Levels.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Menu extends StatefulWidget {
  //TODO: udelat user level, jmeno, obrazek

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: [
            //BACKGROUND
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.9],
              colors: [Colors.white, pColorBG],
            ))),
            
            //BODY
            SingleChildScrollView(
              child: Column(children: [
                //LOGO
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            child: CustomPaint(
                              size: Size(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height * 0.25),
                              painter: DrawLogoBackground(),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Center(
                                child: Image(
                              image: AssetImage('assets/images/logo.png'),
                              width: MediaQuery.of(context).size.width * 0.45,
                              alignment: Alignment.center,
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                //USER_INFO
                Column(
                  children: [
                    //LEVEL
                    showLevel(),

                    //USER_PICTURE
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 5),
                      child: Stack(
                        children: [
                          Image(
                            image: AssetImage('assets/images/img_user.png'),
                            width: 110,
                            height: 110,
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                    ),

                    //USERNAME
                    showUsername(),

                    //XP_BAR
                    showExpBar(),

                    //XP
                    showExp(),
                  ],
                ),
                

                //MENU
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  //PLAY_BTN
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: SizedBox(
                      width: 170,
                      height: 35,
                      child: RaisedButton(
                        onPressed: () {Navigator.of(context).pushNamed('/quiz', arguments: 10);},
                        child: Text(
                          'Hrát',
                          style: FirstScreenbody,
                        ),
                        color: btnColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),

                  //HIGHSCORE_BTN
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: SizedBox(
                      width: 170,
                      height: 35,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'Žebříček',
                          style: FirstScreenbody,
                        ),
                        color: btnColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),

                  //QUESTION_BTN
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: SizedBox(
                      width: 170,
                      height: 35,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'Otázky',
                          style: FirstScreenbody,
                        ),
                        color: btnColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),

                  //ICONS_BTN
                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              color: Colors.grey,
                              iconSize: 35,
                              padding: EdgeInsets.all(15),
                              icon: Icon(Icons.settings),
                              onPressed: () {}),
                          IconButton(
                              color: Colors.grey,
                              iconSize: 35,
                              padding: EdgeInsets.all(15),
                              icon: Icon(Icons.favorite),
                              onPressed: () {}),
                        ],
                      ))
                ])
              ]),
            )
          ],
        ));
  }
}

Future getUsername() async {
  SharedPreferences user = await SharedPreferences.getInstance();
  return user.getString('username');
}

Future getLevel() async {
  SharedPreferences user = await SharedPreferences.getInstance();
  return user.getInt('level');
}

Future getExp() async {
  SharedPreferences user = await SharedPreferences.getInstance();
  int _exp = user.getInt('exp');
  int _lvl = user.getInt('level');
  int _nextLvl = Levels[_lvl-1].exp;
  return "$_exp/$_nextLvl";
}

Future getExpRatio() async {
  SharedPreferences user = await SharedPreferences.getInstance();
  int _exp = user.getInt('exp');
  int _lvl = user.getInt('level');
  int _nextLvl = Levels[_lvl-1].exp;
  double _ratio = _exp / _nextLvl;
  return _ratio;
}

Widget showUsername() {
  return FutureBuilder(
    future: getUsername(),
    builder: (context, projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
        return Container();
      }
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Text(
            projectSnap.data ?? "",
            style: MenuName,
          ),
        ),
      );
    },
  );
}

Widget showLevel() {
  return FutureBuilder(
    future: getLevel(),
    builder: (context, projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
        return Container();
      }
      return Container(
        child: Text(
          "Level: " + projectSnap.data.toString() ?? "",
          style: MenuLevel,
        ),
      );
    },
  );
}

Widget showExpBar() {
  return FutureBuilder(
    future: getExpRatio(),
    builder: (context, projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
        return Container();
      }
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 5),
        width: MediaQuery.of(context).size.width * 0.50,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(
            expColor,
          ),
          value: projectSnap.data 
        ),
      );
    },
  );
}

Widget showExp() {
  return FutureBuilder(
    future: getExp(),
    builder: (context, projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
        return Container();
      }
      return Container(
        padding: EdgeInsets.only(bottom: 25),
        child: Text(
          projectSnap.data ?? "",              //'$_userExp/$_nextLevelExp',
          style: MenuExp,
        ),
      );
    },
  );
}



class DrawLogoBackground extends CustomPainter {
  Paint _paintTriangleYellow;
  Paint _paintTriangleBlue;
  Paint _paintTriangleGreen;
  Paint _paintTrianglepurple;

  DrawLogoBackground() {
    _paintTriangleYellow = Paint()
      ..color = Color(0xffFFFFC7)
      ..style = PaintingStyle.fill;

    _paintTriangleBlue = Paint()
      ..color = Color(0xffC0E9FB)
      ..style = PaintingStyle.fill;

    _paintTriangleGreen = Paint()
      ..color = Color(0xffD9FFE5)
      ..style = PaintingStyle.fill;

    _paintTrianglepurple = Paint()
      ..color = Color(0xffF9D9FF)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2 + 10, 0);
    path.lineTo(size.width - 30, 0);
    path.lineTo(size.width * 0.45, size.height * 0.90);
    path.close();
    canvas.drawPath(path, _paintTriangleYellow);

    var path2 = Path();
    path2.moveTo(size.width * 0.42, size.height * 0.37);
    path2.lineTo(size.width * 0.52, size.height * 0.26);
    path2.lineTo(size.width * 0.55, size.height * 0.83);
    path2.close();
    canvas.drawPath(path2, _paintTriangleBlue);

    var path3 = Path();
    path3.moveTo(size.width * 0.36, size.height * 0.42);
    path3.lineTo(size.width * 0.63, size.height * 0.58);
    path3.lineTo(size.width * 0.60, size.height * 0.82);
    path3.close();
    canvas.drawPath(path3, _paintTriangleGreen);

    var path4 = Path();
    path4.moveTo(size.width * 0.35, size.height * 0.57);
    path4.lineTo(size.width * 0.41, size.height * 0.88);
    path4.lineTo(size.width * 0.61, size.height * 0.44);
    path4.close();
    canvas.drawPath(path4, _paintTrianglepurple);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


