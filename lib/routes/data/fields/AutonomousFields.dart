// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';

class AutonomousFields extends StatefulWidget {
  const AutonomousFields({
    Key? key,
  }) : super(key: key);

  @override
  State<AutonomousFields> createState() => _AutonomousFieldsState();
}

class _AutonomousFieldsState extends State<AutonomousFields> {
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
        // Auto mobility dropdown
        PlatformDropdownMenu(
            dropdownMenuSelectedItem: AutonomousValues.autoMobility.text,
            onChanged: (value) {
              setState(() {
                AutonomousValues.autoMobility.text = value;
              });
            },
            dropdownItems: OptionConstants.yesNoOptions,
            margin: const EdgeInsets.only(left: 20)),
        //speaker scored
        CounterNumberField(
            controller: AutonomousValues.autoSpeakerScored,
            onTapDecrement: () =>
                decrementNumber(AutonomousValues.autoSpeakerScored),
            onTapIncrement: () =>
                incrementNumber(AutonomousValues.autoSpeakerScored)),
        //speaker missed
        CounterNumberField(
            controller: AutonomousValues.autoSpeakerMissed,
            onTapDecrement: () =>
                decrementNumber(AutonomousValues.autoSpeakerMissed),
            onTapIncrement: () =>
                incrementNumber(AutonomousValues.autoSpeakerMissed)),
        //amp scored
        CounterNumberField(
            controller: AutonomousValues.autoAmpScored,
            onTapDecrement: () =>
                decrementNumber(AutonomousValues.autoAmpScored),
            onTapIncrement: () =>
                incrementNumber(AutonomousValues.autoAmpScored)),
        //amp missed
        CounterNumberField(
            controller: AutonomousValues.autoAmpMissed,
            onTapDecrement: () =>
                decrementNumber(AutonomousValues.autoAmpMissed),
            onTapIncrement: () =>
                incrementNumber(AutonomousValues.autoAmpMissed)),
      ],
    );
  }
}
