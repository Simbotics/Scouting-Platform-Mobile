// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/builders/bases/CustomCheckbox.dart';

class AutonomousRow2 extends StatefulWidget {
  const AutonomousRow2({
    super.key,
  });

  @override
  State<AutonomousRow2> createState() => _AutonomousRow2State();
}

class _AutonomousRow2State extends State<AutonomousRow2> {
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
      height: 40, // Set a height for the container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Center the row contents
        children: [
          // A
          CustomCheckbox(
              controller: AutonomousValues.l3A,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 18.0)),
          // L
          CustomCheckbox(
              controller: AutonomousValues.l3L,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 35.0)),
          // K
          CustomCheckbox(
              controller: AutonomousValues.l3K,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 35.0)),
          // J
          CustomCheckbox(
              controller: AutonomousValues.l3J,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 30.0)),
          // I
          CustomCheckbox(
              controller: AutonomousValues.l3I,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 25.0)),
          // H
          CustomCheckbox(
              controller: AutonomousValues.l3H,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.all(0.0)),
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 170.0,
                child: const Text(
                  "L3",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ),
              )),
        ],
      ),
    );
  }
}
