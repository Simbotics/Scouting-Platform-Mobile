import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const NumberInputField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  _NumberInputFieldState createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 47,
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.only(top: 4.0, left: 20.0),
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
