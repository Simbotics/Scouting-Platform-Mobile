// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

import '../../builders/numberFieldWithCounter.dart';
import '../../main.dart';
import '../../routes/comments.dart';
import '../../builders/dropdownMenu.dart';
import '../../builders/numberInputField.dart';
import '../../sections/autoScoutingData.dart';
import '../../sections/teleopScoutingData.dart';

class Row4Fields extends StatefulWidget {
  const Row4Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row4FieldsState createState() => _Row4FieldsState();
}

class _Row4FieldsState extends State<Row4Fields> {
  @override
  void initState() {
    super.initState();
  }

  // Dropdown menu options
  final List<String> yesNoOptions = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Auto missed
        NumberInputFieldWithCounter(
          margin: const EdgeInsets.only(left: 170),
          controller: AutoScoutingData.autoMissedController,
          onTapIncrement: () {
            int currentValue =
                int.parse(AutoScoutingData.autoMissedController.text);
            setState(() {
              currentValue++;
              AutoScoutingData.autoMissedController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(AutoScoutingData.autoMissedController.text);
            setState(() {
              currentValue--;
              AutoScoutingData.autoMissedController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teeop cones missed
        NumberInputFieldWithCounter(
          margin: const EdgeInsets.only(left: 83),
          controller: TeleopScoutingData.teleopConeMissedController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopConeMissedController.text);
            setState(() {
              currentValue++;
              TeleopScoutingData.teleopConeMissedController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopConeMissedController.text);
            setState(() {
              currentValue--;
              TeleopScoutingData.teleopConeMissedController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cubes missed
        NumberInputFieldWithCounter(
          controller: TeleopScoutingData.teleopCubeMissedController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopCubeMissedController.text);
            setState(() {
              currentValue++;
              TeleopScoutingData.teleopCubeMissedController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopCubeMissedController.text);
            setState(() {
              currentValue--;
              TeleopScoutingData.teleopCubeMissedController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cones dropped
        NumberInputFieldWithCounter(
          controller: TeleopScoutingData.teleopConeDroppedController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopConeDroppedController.text);
            setState(() {
              currentValue++;
              TeleopScoutingData.teleopConeDroppedController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopConeDroppedController.text);
            setState(() {
              currentValue--;
              TeleopScoutingData.teleopConeDroppedController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
      ],
    );
  }
}
