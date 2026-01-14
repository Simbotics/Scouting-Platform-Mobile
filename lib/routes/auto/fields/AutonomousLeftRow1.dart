// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';

class AutonomousLeftRow1 extends StatefulWidget {
  const AutonomousLeftRow1({
    super.key,
  });

  @override
  State<AutonomousLeftRow1> createState() => _AutonomousLeftRow1State();
}

class _AutonomousLeftRow1State extends State<AutonomousLeftRow1> {
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
        mainAxisAlignment: MainAxisAlignment.start, // Center the row contents
        children: [
          // Auto starting position
          PlatformDropdownMenu(
              dropdownMenuSelectedItem: AutonomousValues.autoStartPosition.text,
              onChanged: (value) {
                setState(() {
                  AutonomousValues.autoStartPosition.text = value;
                });
              },
              dropdownItems: OptionConstants.startPositions),
          // Auto mobility
          PlatformDropdownMenu(
              dropdownMenuSelectedItem: AutonomousValues.autoMobility.text,
              onChanged: (value) {
                setState(() {
                  AutonomousValues.autoMobility.text = value;
                });
              },
              dropdownItems: OptionConstants.yesNoOptions,
              margin: const EdgeInsets.only(left: 10)),
        ],
      ),
    );
  }
}
