import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final EdgeInsetsGeometry margin;
  final double width;
  final Function onChanged;
  final TextAlign textAlign;
  final Color textInputColor;
  final double textInputFontSize;
  final String hintText;
  final Color inputFieldColor;
  final InputBorder inputFieldBorder;

  const TextInputField(
      {Key? key,
      this.margin = const EdgeInsets.only(top: 0.0),
      this.width = 300.0,
      required this.onChanged,
      required this.textAlign,
      this.textInputColor = Colors.white,
      this.textInputFontSize = 14,
      required this.hintText,
      this.inputFieldColor = AppStyle.textInputColor,
      this.inputFieldBorder = InputBorder.none})
      : super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late Color textColor;

  @override
  void initState() {
    super.initState();
    textColor = widget.textInputColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width,
      child: TextField(
        onChanged: (value) {
          widget.onChanged(value);
        },
        textAlign: widget.textAlign,
        style: TextStyle(
          color: textColor,
          fontSize: widget.textInputFontSize,
          fontFamily: 'Helvetica',
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontFamily: 'Helvetica'),
          filled: true,
          fillColor: widget.inputFieldColor,
          border: widget.inputFieldBorder,
        ),
      ),
    );
  }
}
