// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/builders/bases/StopwatchButton.dart';

class AutonomousLeftRow3 extends StatefulWidget {
  const AutonomousLeftRow3({
    super.key,
  });

  @override
  State<AutonomousLeftRow3> createState() => _AutonomousLeftRow3State();
}

class _AutonomousLeftRow3State extends State<AutonomousLeftRow3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      height: 60, // Set a height for the container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Center the row contents
        children: [
          StopwatchButton(
              value: AutonomousValues.autoClimbTime,
              timer: AutonomousValues.stopwatch),
          PlatformDropdownMenu(
              dropdownMenuSelectedItem: AutonomousValues.autoClimbPosition.text,
              onChanged: (value) {
                setState(() {
                  AutonomousValues.autoClimbPosition.text = value;
                });
              },
              dropdownItems: OptionConstants.climbPosition,
              margin: const EdgeInsets.only(left: 20)),
        ],
      ),
    );
  }
}
