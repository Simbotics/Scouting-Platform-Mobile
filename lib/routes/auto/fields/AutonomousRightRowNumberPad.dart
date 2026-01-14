// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/NumberPadBase.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';

class AutonomousRightrowNumberPad extends StatefulWidget {
  const AutonomousRightrowNumberPad({
    super.key,
  });
  @override
  State<AutonomousRightrowNumberPad> createState() =>
      _AutonomousRightrowNumberPadState();
}

class _AutonomousRightrowNumberPadState
    extends State<AutonomousRightrowNumberPad> {
  void onNumberPressed(String number) {
    if (!mounted) return;
    setState(() {
      AutonomousValues.numberPadDisplayedValue.text += number;
    });
  }

  void onDeletePressed() {
    if (!mounted) return;
    setState(() {
      AutonomousValues.numberPadDisplayedValue.text = "";
    });
  }

  void onSubmitPressed() {
    if (!mounted) return;
    int addingValue = int.parse(AutonomousValues.numberPadDisplayedValue.text);
    int currentValue = int.parse(AutonomousValues.autoBallScored.text);
    int finalValue = addingValue + currentValue;
    setState(() {
      AutonomousValues.numberPadDisplayedValue.text = "";
      AutonomousValues.autoBallScored.text = finalValue.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: SizedBox(
          height: 40,
          width: 150,
          child: TextField(
            controller: AutonomousValues.numberPadDisplayedValue,
            readOnly: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Input Number"),
          ),
        )),
        SizedBox(
          height: 20,
        ),
        Center(
          child: NumberPadBase(
              onNumberPressed: onNumberPressed,
              onDelete: onDeletePressed,
              onSubmit: onSubmitPressed),
        )
      ],
    );
  }
}
