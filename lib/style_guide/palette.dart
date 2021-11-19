import 'package:flutter/material.dart';

class Palette {
  static const Color clear = Color.fromRGBO(0, 0, 0, 0.0);

  static const Color black = Colors.black;
  static const Color gray10 = Color.fromRGBO(5, 5, 5, 1.0);
  static const Color gray7 = Color.fromRGBO(85, 85, 85, 1.0);
  static const Color gray5 = Color.fromRGBO(125, 125, 125, 1.0);
  static const Color gray2 = Color.fromRGBO(185, 185, 185, 1.0);
  static const Color offWhite = Color.fromRGBO(240, 240, 240, 1.0);
  static const Color white = Colors.white;

  static Color gray(int amount) {
    return Color.fromRGBO(amount, amount, amount, 1.0);
  }
}

