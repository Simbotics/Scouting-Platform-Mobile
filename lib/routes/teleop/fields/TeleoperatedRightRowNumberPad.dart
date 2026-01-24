// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/NumberPadBase.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class TeleoperatedRightRowNumberPad extends StatefulWidget {
  const TeleoperatedRightRowNumberPad({
    super.key,
  });
  @override
  State<TeleoperatedRightRowNumberPad> createState() =>
      _TeleoperatedRightRowNumberPadState();
}

class _TeleoperatedRightRowNumberPadState
    extends State<TeleoperatedRightRowNumberPad> {
  void onNumberPressed(String number) {
    if (!mounted) return;
    setState(() {
      TeleoperatedValues.numberPadDisplayedValue.text += number;
    });
  }

  void onDeletePressed() {
    if (!mounted) return;
    setState(() {
      TeleoperatedValues.numberPadDisplayedValue.text = "";
    });
  }

  void onSubmitScorePressed() {
    if (!mounted) return;
    setState(() {
      try {
        int addingValue =
            int.parse(TeleoperatedValues.numberPadDisplayedValue.text);
        int currentValue = int.parse(TeleoperatedValues.ballsScored.text);
        int finalValue = addingValue + currentValue;
        TeleoperatedValues.numberPadDisplayedValue.text = "";
        TeleoperatedValues.ballsScored.text = finalValue.toString();
      } catch (e) {
        TeleoperatedValues.numberPadDisplayedValue.text = "";
      }
    });
  }

  void onSubmitPassPressed() {
    if (!mounted) return;
    setState(() {
      try {
        int addingValue =
            int.parse(TeleoperatedValues.numberPadDisplayedValue.text);
        int currentValue = int.parse(TeleoperatedValues.ballsPassed.text);
        int finalValue = addingValue + currentValue;
        TeleoperatedValues.numberPadDisplayedValue.text = "";
        TeleoperatedValues.ballsPassed.text = finalValue.toString();
      } catch (e) {
        TeleoperatedValues.numberPadDisplayedValue.text = "";
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
            style: TextStyle(fontSize: 20),
            controller: TeleoperatedValues.numberPadDisplayedValue,
            readOnly: true,
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
              showPassButton: true,
              onNumberPressed: onNumberPressed,
              onDelete: onDeletePressed,
              onSubmitScore: onSubmitScorePressed,
              onSubmitPass: onSubmitPassPressed),
        )
      ],
    );
  }
}
