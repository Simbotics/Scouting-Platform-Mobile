// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';

class AutonomousRightRow2 extends StatefulWidget {
  const AutonomousRightRow2({
    super.key,
  });

  @override
  State<AutonomousRightRow2> createState() => _AutonomousRightRow2State();
}

class _AutonomousRightRow2State extends State<AutonomousRightRow2> {
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
      decoration: BoxDecoration(),
      height: 60, // Set a height for the container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Center the row contents
        children: [
          // Coral missed counter
          CounterNumberField(
              margin: EdgeInsets.zero,
              controller: AutonomousValues.coralMissed,
              onTapIncrement: () =>
                  incrementNumber(AutonomousValues.coralMissed),
              onTapDecrement: () =>
                  decrementNumber(AutonomousValues.coralMissed)),
        ],
      ),
    );
  }
}
