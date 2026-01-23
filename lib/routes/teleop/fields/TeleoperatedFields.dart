// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/StopwatchButton.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class TeleoperatedFields extends StatefulWidget {
  const TeleoperatedFields({
    super.key,
  });

  @override
  State<TeleoperatedFields> createState() => _TeleoperatedFields2State();
}

class _TeleoperatedFields2State extends State<TeleoperatedFields> {
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
        StopwatchButton(
            value: TeleoperatedValues.defenseTime,
            timer: TeleoperatedValues.stopwatch)
      ],
    );
  }
}
