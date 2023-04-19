// ignore_for_file: file_names
import 'package:flutter/material.dart';

class FieldHeaderStyle extends StatelessWidget {
  final String text; // The text to display as a title
  final FontWeight fontWeight; // The weight of the font (bold, italic, etc)
  final EdgeInsets padding; // The padding around the text
  final double width;

  const FieldHeaderStyle(
      {Key? key,
      required this.text, // The text to display as a header
      this.fontWeight =
          FontWeight.bold, // The weight of the font (bold, italic, etc)
      required this.padding, // The padding around the text
      this.width = 170.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: padding,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: fontWeight,
              fontFamily: 'Helvetica'),
        ),
      ),
    );
  }
}
