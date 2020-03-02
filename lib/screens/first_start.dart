import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qlaw/styles.dart';

class FirstStart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
                        // size: Size(200,200),
              painter: DrawBodyBackground(),
            ),
          ),
          
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(  
                height: MediaQuery.of(context).size.height * 0.34,             

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.white,
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
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Vítej v aplikaci QLaw!',
                        style: FirstScreenHeader,
                        ),
                    ),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height * 0.66,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0,color: Color(0xff48E0DA)),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  ),
                  // color: Colors.greenAccent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      // padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                      height: 50,
                      // color: Colors.blue,
                      child: Text(
                        'Prosím, řekni nám něco o sobě',
                        style: FirstScreenbody,
                      ),

                    ),

                    Container(
                      // padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                      height: 150,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'zadej username',
                              style: FirstScreenbody,
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Jmeno',
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      // padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                      height: 150,
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'vyber skolu',
                              style: FirstScreenbody,
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Skola',
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      // padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                      height: 50,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.party_mode,
                                color: Colors.grey,
                                size: 35,
                              ),
                          Icon(Icons.save,
                                color: Colors.grey,
                                size: 35,
                              )
                        ],
                      ),
                    ),

                    Container(
                      // padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                      height: 120,
                      color: Colors.purple
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


class DrawBodyBackground extends CustomPainter {

  Paint _paintBlock;
  Paint _paintTriangle;
  Paint _paintCircle;

  DrawBodyBackground() {
    _paintBlock = Paint()
      ..color = Color(0xffBEFFD9)
      ..style = PaintingStyle.fill;

    _paintTriangle = Paint()
      ..color = Color(0xffE8F8F7)
      ..style = PaintingStyle.fill;

    _paintCircle = Paint()
      ..color = Color(0xffBFFFFD)
      ..style = PaintingStyle.fill;
 
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    // var path = Path();
    // path.moveTo(0, size.height * 0.85);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width * 0.3, size.height);
    // path.lineTo(size.width * 0.6, size.height * 0.75);
    // path.lineTo(size.width * 0.25, size.height * 0.65);
    // path.close();
    // canvas.drawPath(path, _paintBlock);

    var path = Path();
    path.moveTo(size.width * 0.10, size.height * 0.65);
    path.lineTo(size.width * 0.10, size.height * 0.90);
    path.lineTo(size.width * 0.35, size.height * 0.90);
    path.lineTo(size.width * 0.35, size.height * 0.65);
    path.close();
    canvas.drawPath(path, _paintBlock);

    var path2 = Path();
    path2.moveTo(size.width * 0.33, size.height * 0.46);
    path2.lineTo(size.width * 0.92, size.height * 0.60);
    path2.lineTo(size.width * 0.48, size.height * 0.77);
    path2.close();
    canvas.drawPath(path2, _paintTriangle);

    var circleLocation = Offset(size.width * 0.75, size.height * 0.85);
    canvas.drawCircle(circleLocation, 60.0, _paintCircle);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}