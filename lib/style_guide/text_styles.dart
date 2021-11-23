import 'package:flutter/material.dart';
import 'package:telescope/style_guide/palette.dart';

class TextStyles {
  // BASE
  static TextStyle baseStyle = TextStyle(
    fontFamily: 'Andale Mono',
    color: Palette.gray10,
  );

  // HEADER
  static TextStyle baseHeaderStyle = baseStyle.copyWith(height: 1.6);
  static TextStyle header1 = baseHeaderStyle.copyWith(fontSize: 30);

  // NORMAL TEXT
  static TextStyle textXL = baseStyle.copyWith(fontSize: 20);
  static TextStyle textL = baseStyle.copyWith(fontSize: 18);
  static TextStyle textM = baseStyle.copyWith(fontSize: 16);
  static TextStyle textS = baseStyle.copyWith(fontSize: 13);
  static TextStyle textXS = baseStyle.copyWith(fontSize: 11);
}

extension TextStyleExtension on TextStyle {
  TextStyle bold() => this.copyWith(fontWeight: FontWeight.bold);
  TextStyle offBlack() => this.copyWith(color: Palette.offBlack);
  TextStyle offWhite() => this.copyWith(color: Palette.offWhite);
  TextStyle helpText() => this.copyWith(color: Palette.offWhite);
}
