// ignore_for_file: file_names
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function onTapIncrement;
  final Function onTapDecrement;
  final EdgeInsets margin;

  const CounterNumberField({
    super.key,
    required this.controller,
    required this.onTapIncrement,
    required this.onTapDecrement,
    this.hintText = "0",
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 47,
      padding: const EdgeInsets.all(3),
      margin: margin,
      decoration: BoxDecoration(color: AppStyle.textInputColor, borderRadius: BorderRadius.circular(6.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => onTapDecrement.call(),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
              size: 28,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: TextFormField(
                enabled: false,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
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
                onTap: () => onTapIncrement.call(),
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
