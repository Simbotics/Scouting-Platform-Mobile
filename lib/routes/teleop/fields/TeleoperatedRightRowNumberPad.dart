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

  void onSubmitPressed() {
    if (!mounted) return;
    int addingValue =
        int.parse(TeleoperatedValues.numberPadDisplayedValue.text);
    int currentValue = int.parse(TeleoperatedValues.ballsScored.text);
    int finalValue = addingValue + currentValue;
    setState(() {
      TeleoperatedValues.numberPadDisplayedValue.text = "";
      TeleoperatedValues.ballsScored.text = finalValue.toString();
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
            controller: TeleoperatedValues.numberPadDisplayedValue,
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
