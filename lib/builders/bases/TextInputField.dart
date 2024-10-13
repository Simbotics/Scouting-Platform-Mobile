// ignore_for_file: file_names
import 'package:flutter/services.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;
  final Function onChanged;
  final TextAlign textAlign;
  final Color textInputColor;
  final double textInputFontSize;
  final String hintText;
  final Color inputFieldColor;
  final InputBorder inputFieldBorder;
  final int maxLines;
  final TextEditingController controller;

  const TextInputField(
      {super.key,
      this.margin = const EdgeInsets.only(top: 0.0),
      this.width = 150.0,
      this.height = 47.5,
      required this.onChanged,
      required this.textAlign,
      this.textInputColor = Colors.white,
      this.textInputFontSize = 16,
      required this.hintText,
      this.inputFieldColor = AppStyle.textInputColor,
      this.inputFieldBorder = InputBorder.none,
      this.maxLines = 1,
      required this.controller});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
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
      height: widget.height,
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(140),
        ],
        maxLines: widget.maxLines,
        controller: widget.controller,
        textAlign: widget.textAlign,
        style: TextStyle(
          color: textColor,
          fontSize: widget.textInputFontSize,
          fontFamily: 'Helvetica',
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:
              const TextStyle(fontFamily: 'Helvetica', color: Colors.grey),
          filled: true,
          fillColor: widget.inputFieldColor,
          border: widget.inputFieldBorder,
        ),
        onChanged: (value) {
          final cursorPosition = widget.controller.selection;
          widget.onChanged(value);
          widget.controller.value = widget.controller.value.copyWith(
            text: value,
            selection: cursorPosition,
          );
        },
      ),
    );
  }
}

