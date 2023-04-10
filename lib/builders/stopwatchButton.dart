// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

class StopwatchButton extends StatelessWidget {
  /// Options for stopwatch button builder

  // Variable to change when it it activated and tracking time
  final String variable;
  // Text to display on the button
  final String text;
  // Method to activate when it is pressed
  final Function stopwatchMethod;

  const StopwatchButton({
    Key? key,
    required this.variable,
    required this.text,
    required this.stopwatchMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      child: ElevatedButton(
        child: Text(text,
            style: const TextStyle(fontSize: 16.0, fontFamily: "Helvetica")),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(150.0, 47.0),
            backgroundColor: AppStyle.textInputColorLight),
        onPressed: () {
          stopwatchMethod();
        },
      ),
    );
  }
}
