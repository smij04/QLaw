import 'package:flutter/material.dart';


class cLevel {
  final int   _level;
  final int   exp;

  cLevel(this._level, {
    this.exp,
    }
  );

}

List <cLevel> Levels = [
  cLevel(1, exp: 250),
  cLevel(2, exp: 400),
  cLevel(3, exp: 600),
  cLevel(4, exp: 900),
  cLevel(5, exp: 1400),
  cLevel(6, exp: 1950),
  cLevel(7, exp: 2700),
  cLevel(8, exp: 3500),
  cLevel(9, exp: 4500),
  cLevel(10, exp: 5700),
  cLevel(11, exp: 6000),
  cLevel(12, exp: 7600),
  cLevel(13, exp: 9200),
  cLevel(14, exp: 11000),
  cLevel(15, exp: 13500),
  cLevel(16, exp: 16500),
  cLevel(17, exp: 19000),
  cLevel(18, exp: 23500),
  cLevel(19, exp: 30000),
  cLevel(20, exp: 38000),
  cLevel(21, exp: 48000),
  cLevel(22, exp: 60000),

];