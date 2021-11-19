import 'package:flutter/material.dart';

class Palette {
  static const Color clear = Color.fromRGBO(0, 0, 0, 0.0);

  static const Color black = Colors.black;
  static const Color offBlack = Color.fromRGBO(35, 35, 35, 1.0);
  static const Color gray10 = Color.fromRGBO(5, 5, 5, 1.0);
  static const Color gray7 = Color.fromRGBO(85, 85, 85, 1.0);
  static const Color gray5 = Color.fromRGBO(125, 125, 125, 1.0);
  static const Color gray3 = Color.fromRGBO(165, 165, 165, 1.0);
  static const Color gray2 = Color.fromRGBO(195, 195, 195, 1.0);
  static const Color offWhite = Color.fromRGBO(240, 240, 240, 1.0);
  static const Color white = Colors.white;

  static Color gray(int amount) {
    return Color.fromRGBO(amount, amount, amount, 1.0);
  }
}

