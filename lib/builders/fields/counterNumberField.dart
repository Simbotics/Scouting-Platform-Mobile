// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function onTapIncrement;
  final Function onTapDecrement;
  final EdgeInsets margin;

  const CounterNumberField({
    Key? key,
    required this.controller,
    required this.onTapIncrement,
    required this.onTapDecrement,
    this.hintText = "0",
    this.margin = const EdgeInsets.only(left: 20.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 47,
      padding: const EdgeInsets.all(3),
      margin: margin,
      color: AppStyle.textInputColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTapDecrement.call(),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
              size: 40,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              color: AppStyle.textInputColor,
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
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                controller: controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                  signed: true,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onTapIncrement.call(),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
