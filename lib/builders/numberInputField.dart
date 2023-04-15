// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatefulWidget {
  /// Options for number input field builder

  // Controller which holds the currently types text
  final TextEditingController controller;
  final Function onChanged;
  // "Hint Text" which shows up when nothing it typed in the field
  final String hintText;
  // Margin from sides/top/botto of the screen/widget
  final EdgeInsets margin;
  // Width of the container which holds the field
  final double width;
  // Defines if the field is read only or not (editable)
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
  _NumberInputFieldState createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 47,
      padding: const EdgeInsets.all(3),
      margin: widget.margin,
      decoration: const BoxDecoration(color: AppStyle.textInputColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: AppStyle.textInputColor),
            child: TextFormField(
              readOnly: widget.readOnly,
              onChanged: (value) {
                widget.onChanged(value);
              },
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                //helperText: widget.hintText,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                alignLabelWithHint: true,
                filled: true,
                fillColor: AppStyle.textInputColor,
                //contentPadding: EdgeInsets.all(8.0),
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
          )),
        ],
      ),
    );
  }
}
