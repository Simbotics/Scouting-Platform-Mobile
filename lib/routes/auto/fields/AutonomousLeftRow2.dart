// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';

class AutonomousLeftRow2 extends StatefulWidget {
  const AutonomousLeftRow2({
    super.key,
  });

  @override
  State<AutonomousLeftRow2> createState() => _AutonomousLeftRow2State();
}

class _AutonomousLeftRow2State extends State<AutonomousLeftRow2> {
  /// Increments an integer in a controller's value by one
  void incrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue++;
      controller.text = currentValue.toString();
    });
  }

  /// Decrements an integer in a controller's value by one unless it's 0
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
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(),
      height: 60, // Set a height for the container
      child: Row(
        children: [
          // Ball scored  counter
          CounterNumberField(
              margin: EdgeInsets.zero,
              controller: AutonomousValues.autoBallScored,
              onTapIncrement: () =>
                  incrementNumber(AutonomousValues.autoBallScored),
              onTapDecrement: () =>
                  decrementNumber(AutonomousValues.autoBallScored)),
        ],
      ),
    );
  }
}
