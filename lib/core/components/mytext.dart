import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  Color? color;
  final double size;
  FontWeight? weight;

  MyText(
      {Key? key, required this.text, this.color, this.size = 18, this.weight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
