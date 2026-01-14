// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class TeleoperatedFields4 extends StatefulWidget {
  const TeleoperatedFields4({
    super.key,
  });

  @override
  State<TeleoperatedFields4> createState() => _TeleoperatedFields4State();
}

class _TeleoperatedFields4State extends State<TeleoperatedFields4> {
  /// Increments an integer in a controllers value by one
  void incrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue++;
      controller.text = currentValue.toString();
    });
  }

  /// Decrements an integer in a controllers value by one unless it's 0
  void decrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue--;
      controller.text = (currentValue > 0 ? currentValue : 0).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //num of balls scored
        CounterNumberField(
            controller: TeleoperatedValues.ballsScored,
            onTapDecrement: () => decrementNumber(TeleoperatedValues.ballsScored),
            onTapIncrement: () => incrementNumber(TeleoperatedValues.ballsScored)),
        
      ],
    );
  }
}
