import 'package:flutter/material.dart';

class MyColor {
  static Color kNbuColor = Color(0XFFFBF945D);
  static Color kPrimaryColor = Color.fromRGBO(36, 106, 150, 1);
  static Color kWhite = Colors.white;
  static Color kBlack = Colors.black;
  static Color kPurple = Color(0XFF9F30F6);
  static Color kPrimaryGrey = Color(0XFF676767);
  static Color kGrey = Colors.grey.shade300;
  static Color kGreen = Colors.blue;
}
class GradientColor {
  static LinearGradient gradientColor = LinearGradient(
      colors: [MyColor.kPurple, MyColor.kPrimaryColor],
      begin: Alignment.topLeft);
}
