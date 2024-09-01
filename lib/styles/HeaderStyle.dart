import 'package:flutter/material.dart';

class HeaderStyle extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final EdgeInsets padding;

  const HeaderStyle(
      {Key? key,
      required this.text,
      this.fontWeight = FontWeight.normal,
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
            fontSize: 25.0,
            color: Colors.white,
            fontWeight: fontWeight,
            fontFamily: 'Helvetica'),
      ),
    );
  }
}
