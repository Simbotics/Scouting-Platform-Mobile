// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TitleStyle extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final EdgeInsets padding;

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
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: fontWeight,
            fontFamily: 'Futura'),
      ),
    );
  }
}
