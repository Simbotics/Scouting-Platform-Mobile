import 'package:flutter/material.dart';

class HeaderStyle extends StatelessWidget {
  final String text; // The text to display as a title
  final FontWeight fontWeight; // The weight of the font (bold, italic, etc)
  final EdgeInsets padding; // The padding around the text

  const HeaderStyle(
      {Key? key,
      required this.text, // The text to display as a header
      this.fontWeight =
          FontWeight.normal, // The weight of the font (bold, italic, etc)
      required this.padding // The padding around the text
      })
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
            fontSize: 25.0, color: Colors.white, fontWeight: fontWeight),
      ),
    );
  }
}
