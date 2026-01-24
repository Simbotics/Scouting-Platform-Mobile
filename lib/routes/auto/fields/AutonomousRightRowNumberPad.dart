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
    setState(() {
      try {
        int addingValue =
            int.parse(AutonomousValues.numberPadDisplayedValue.text);
        int currentValue = int.parse(AutonomousValues.autoBallScored.text);
        int finalValue = addingValue + currentValue;
        AutonomousValues.numberPadDisplayedValue.text = "";
        AutonomousValues.autoBallScored.text = finalValue.toString();
      } catch (e) {
        AutonomousValues.numberPadDisplayedValue.text = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: SizedBox(
          height: 50,
          width: 200,
          child: TextField(
            controller: AutonomousValues.numberPadDisplayedValue,
            readOnly: true,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                hintText: "Input Number"),
          ),
        )),
        SizedBox(
          height: 20,
        ),
        Center(
          child: NumberPadBase(
            showPassButton: false,
            onNumberPressed: onNumberPressed,
            onDelete: onDeletePressed,
            onSubmitScore: onSubmitPressed,
            onSubmitPass: () {},
          ),
        )
      ],
    );
  }
}
