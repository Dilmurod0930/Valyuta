import 'package:flutter/material.dart';

class MyBoxDecoration {
  static boxDecoration({Color? color1, Color? color2}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: color2!),
      color: color1,
    );
  }

  static bottomBorder({Color? color}) {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)),
      color: color,
    );
  }

  static boxDecWithShadow({Color? color, Color? shadowColor}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: shadowColor!.withOpacity(0.6),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(1, 4),
        ),
      ],
      color: color,
    );
  }
}
