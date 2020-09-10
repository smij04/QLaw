import 'package:flutter/material.dart';

class CShool {
  final int position;
  final String name;
  final Color color;
  final String picture;

  CShool(
    this.position, {
      this.name,
      this.color,
      this.picture,
    }
  );

}


List<CShool> Schools = [
  CShool(1,
    name: 'PF UK',
    color: Color(0xFF7ED3FF),
    picture: 'assets/images/PF_UK_LOGO.png',
  ),
  CShool(2,
    name: 'LAW MUNI',
    color: Color(0xFFD1C1FF),
    picture: 'assets/images/LAW_MUNI_LOGO.png',
  ),
  CShool(3,
    name: 'FPR ZČU',
    color: Color(0xFFFFBBBB),
    picture: 'assets/images/FPR_ZCU_LOGO.png',
  ),
  CShool(4,
    name: 'PF UPOL',
    color: Color(0xFFA5FFD5),
    picture: 'assets/images/UPOL_LOGO.png',
  ),
  CShool(5,
    name: 'Jiná',
    color: Color(0xFFFDFFCC),
    picture: 'assets/images/NO_SCHOOL_LOGO.png',
  ),
];
