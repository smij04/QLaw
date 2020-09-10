import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:qlaw/styles.dart';
import 'package:qlaw/models/schools.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstStart extends StatefulWidget {

  @override
  _FirstStartState createState() => _FirstStartState();
}

class _FirstStartState extends State<FirstStart> {

  final usernameController = TextEditingController();
  final schoolController = SwiperController();

  String _username;
  int _school;

  Future _nextPressed() async {
    final globalUser = await SharedPreferences.getInstance();
    setState(() {
      _username = usernameController.text;
    });

    if (_username.isEmpty) {
      
      print('username je prazdny');
    } else {
      globalUser.setString('username', _username);
      globalUser.setInt('school', _school);
      globalUser.setInt('level', 1);
      globalUser.setInt('exp', 50);
      print(globalUser.getString('username'));
      print(globalUser.getInt('school'));
      print(globalUser.getInt('level'));
      print(globalUser.getInt('exp'));

      //TODO: zkontrolovat zda je username unikatni

      Navigator.of(context).pushNamed('/');
    }
    

  }

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[

          //BACKGROUND
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3,0.8],
                colors: [Colors.white,pColorBG],
              )
            )
          ),
          
          Column(
            children: <Widget>[

              //HEAD
              Container(  
                height: MediaQuery.of(context).size.height * 0.34,             

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          child: CustomPaint(
                            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.28),
                            // size: Size(200,200),
                            painter: DrawLogoBackground(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.28,
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/images/logo.png'),
                              width: MediaQuery.of(context).size.width * 0.50,
                              alignment: Alignment.center,
                              // height: 80.0,
                            )
                          ),
                        )
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        'Vítej v aplikaci QLaw!',
                        style: FirstScreenHeader,
                        ),
                    ),
                  ],
                ),
              ),


              //BODY

              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height * 0.66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    //TEXT USERNAME
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Text(
                        'Prosím, řekni nám něco o sobě',
                        style: FirstScreenbody,
                      ),
                    ),
                    
                    //USERNAME

                    Container(
                      padding: EdgeInsets.only( left: 30, right: 30),
                      // height: 120,
                      height: MediaQuery.of(context).size.height * 0.15,
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Přezdívka:',
                              style: FirstScreenbody,
                            ),
                          ),
                          Container(
                            width: 280,
                            height: 40,
                            child: TextFormField(
                                controller: usernameController,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                maxLength: 12,
                                maxLengthEnforced: true,
                                style: FirstScreenbody,
                                decoration: InputDecoration(
                                  counterText: '',
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: colorCardTop),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.greenAccent),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                  )
                                  
                                ),
                              )
                            
                          )
                          
                        ],
                      ),
                    ),

                    //SCHOOL

                    Container(
                      padding: EdgeInsets.only( left: 0, right: 0),
                      height: MediaQuery.of(context).size.height * 0.28,
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Text(
                              'Škola:',
                              style: FirstScreenbody,
                            ),
                          ),
                          
                          Container(
                            alignment: Alignment.center,
                            child: Swiper(
                              controller: schoolController,
                              itemCount: Schools.length,
                              itemWidth: MediaQuery.of(context).size.width * 0.30,
                              itemHeight: MediaQuery.of(context).size.height * 0.22,
                              layout: SwiperLayout.STACK,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                      // width: 40,
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                        
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  stops: [0.2,0.9],
                                                  colors: [colorCardTop,colorCardBot],
                                                )
                                              ) 
                                            ),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                
                                                SizedBox(
                                                  height: 80,
                                                  child: Center(
                                                    child: Image(
                                                      image: AssetImage('assets/images/PF_UK_LOGO.png'),
                                                      width: 110,
                                                      alignment: Alignment.center,
                                                    )
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    Schools[index].name,
                                                    
                                                    style: FirstScreenCard,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ), 

                                                
                                              ],
                                            )
                                          ]
                                          
                                        )
                                      )
                                    );
                              },
                              onIndexChanged: (index) {
                                _school = index;
                              },
                            )
                          ),
                        ],
                      ),
                    ),


                    // NEXT BUTTON

                    Container(
                      padding: EdgeInsets.only(bottom: 12),
                      height: 50,
                      child: SizedBox(
                        width: 150,
                        child:RaisedButton(
                          onPressed: _nextPressed,
                          child: Text(
                            'Další',
                            style: FirstScreenbody,
                            ),
                          color: btnColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
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
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width * 0.78, size.height);
    path.close();
    canvas.drawPath(path, _paintTriangleYellow);

    var path2 = Path();
    path2.moveTo(size.width * 0.49, size.height * 0.34);
    path2.lineTo(size.width * 0.64, size.height * 0.41);
    path2.lineTo(size.width * 0.50, size.height * 0.85);
    path2.close();
    canvas.drawPath(path2, _paintTriangleBlue);

    var path3 = Path();
    path3.moveTo(size.width * 0.42, size.height * 0.42);
    path3.lineTo(size.width * 0.60, size.height * 0.80);
    path3.lineTo(size.width * 0.50, size.height * 0.88);
    path3.close();
    canvas.drawPath(path3, _paintTriangleGreen);

    var path4 = Path();
    path4.moveTo(size.width * 0.31, size.height * 0.65);
    path4.lineTo(size.width * 0.40, size.height * 0.88);
    path4.lineTo(size.width * 0.60, size.height * 0.45);
    path4.close();
    canvas.drawPath(path4, _paintTrianglepurple);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
