// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterNumberField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function onTapIncrement;
  final Function onTapDecrement;
  final EdgeInsets margin;

  const CounterNumberField(
      {Key? key,
      required this.controller,
      required this.onTapIncrement,
      required this.onTapDecrement,
      this.hintText = "0",
      this.margin = const EdgeInsets.only(left: 20.0)})
      : super(key: key);

  @override
  State<CounterNumberField> createState() => _CounterNumberFieldState();
}

class _CounterNumberFieldState extends State<CounterNumberField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 47,
      padding: const EdgeInsets.all(3),
      margin: widget.margin,
      decoration: const BoxDecoration(color: AppStyle.textInputColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                widget.onTapDecrement.call();
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 40,
              )),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: AppStyle.textInputColor),
            child: TextFormField(
              enabled: false,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppStyle.textInputColor,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                alignLabelWithHint: true,
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
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      widget.onTapIncrement.call();
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    )),
              ]),
        ],
      ),
    );
  }
}
