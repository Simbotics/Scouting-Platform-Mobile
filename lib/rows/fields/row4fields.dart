// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/autoData.dart';
import 'package:scouting_platform/utils/data/teleopData.dart';

import '../../builders/numberFieldWithCounter.dart';

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
          controller: AutoData.autoMissedController,
          onTapIncrement: () {
            int currentValue = int.parse(AutoData.autoMissedController.text);
            setState(() {
              currentValue++;
              AutoData.autoMissedController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue = int.parse(AutoData.autoMissedController.text);
            setState(() {
              currentValue--;
              AutoData.autoMissedController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teeop cones missed
        NumberInputFieldWithCounter(
          margin: const EdgeInsets.only(left: 83),
          controller: TeleopData.teleopConeMissedController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopData.teleopConeMissedController.text);
            setState(() {
              currentValue++;
              TeleopData.teleopConeMissedController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopData.teleopConeMissedController.text);
            setState(() {
              currentValue--;
              TeleopData.teleopConeMissedController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cubes missed
        NumberInputFieldWithCounter(
          controller: TeleopData.teleopCubeMissedController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopData.teleopCubeMissedController.text);
            setState(() {
              currentValue++;
              TeleopData.teleopCubeMissedController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopData.teleopCubeMissedController.text);
            setState(() {
              currentValue--;
              TeleopData.teleopCubeMissedController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cones dropped
        NumberInputFieldWithCounter(
          controller: TeleopData.teleopConeDroppedController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopData.teleopConeDroppedController.text);
            setState(() {
              currentValue++;
              TeleopData.teleopConeDroppedController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopData.teleopConeDroppedController.text);
            setState(() {
              currentValue--;
              TeleopData.teleopConeDroppedController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
      ],
    );
  }
}
