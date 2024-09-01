// ignore_for_file: file_names
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatefulWidget {
  final TextEditingController controller;
  final Function onChanged;
  final String hintText;
  final EdgeInsets margin;
  final double width;
  final bool readOnly;

  const NumberInputField(
      {Key? key,
      required this.controller,
      required this.onChanged,
      required this.hintText,
      this.readOnly = false,
      this.margin = const EdgeInsets.only(top: 4.0, left: 10.0),
      this.width = 150})
      : super(key: key);

  @override
  State<NumberInputField> createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 47,
      padding: const EdgeInsets.all(3),
      margin: widget.margin,
      color: AppStyle.textInputColor,
      child: TextFormField(
        readOnly: widget.readOnly,
        onChanged: (value) => widget.onChanged(value),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          filled: true,
          fillColor: AppStyle.textInputColor,
        ),
        controller: widget.controller,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: false,
          signed: true,
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
