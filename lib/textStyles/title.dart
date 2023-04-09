import 'package:flutter/material.dart';

class TitleStyle extends StatelessWidget {
  final String text; // The text to display as a title
  final FontWeight fontWeight; // The weight of the font (bold, italic, etc)
  final EdgeInsets padding; // The padding around the text

  const TitleStyle(
      {Key? key,
      required this.text,
      this.fontWeight = FontWeight.bold,
      required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: padding,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 30.0, color: Colors.white, fontWeight: fontWeight),
      ),
    );
  }
}
