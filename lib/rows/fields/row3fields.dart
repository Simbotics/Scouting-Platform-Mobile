// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/autoData.dart';
import 'package:scouting_platform/utils/data/teleopData.dart';

import '../../builders/numberFieldWithCounter.dart';
import '../../builders/numberInputField.dart';

class Row3Fields extends StatefulWidget {
  const Row3Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row3FieldsState createState() => _Row3FieldsState();
}

class _Row3FieldsState extends State<Row3Fields> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Auto time to balance stopwatch button
        NumberInputField(
            width: 130,
            margin: const EdgeInsets.only(left: 20.0),
            controller: TeleopData.autoBalanceTimeController,
            onChanged: (value) {},
            hintText: "Enter Time"),
        // Auto low
        NumberInputFieldWithCounter(
          controller: AutoData.autoLowController,
          onTapIncrement: () {
            int currentValue = int.parse(AutoData.autoLowController.text);
            setState(() {
              currentValue++;
              AutoData.autoLowController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue = int.parse(AutoData.autoLowController.text);
            setState(() {
              currentValue--;
              AutoData.autoLowController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cones low
        NumberInputFieldWithCounter(
          margin: const EdgeInsets.only(left: 83),
          controller: TeleopData.teleopConeLowController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopData.teleopConeLowController.text);
            setState(() {
              currentValue++;
              TeleopData.teleopConeLowController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopData.teleopConeLowController.text);
            setState(() {
              currentValue--;
              TeleopData.teleopConeLowController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cubes low
        NumberInputFieldWithCounter(
          controller: TeleopData.teleopCubeLowController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopData.teleopCubeLowController.text);
            setState(() {
              currentValue++;
              TeleopData.teleopCubeLowController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopData.teleopCubeLowController.text);
            setState(() {
              currentValue--;
              TeleopData.teleopCubeLowController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop charging station crosses
        NumberInputFieldWithCounter(
          controller: TeleopData.teleopChargingStationCrossesController,
          onTapIncrement: () {
            int currentValue = int.parse(
                TeleopData.teleopChargingStationCrossesController.text);
            setState(() {
              currentValue++;
              TeleopData.teleopChargingStationCrossesController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue = int.parse(
                TeleopData.teleopChargingStationCrossesController.text);
            setState(() {
              currentValue--;
              TeleopData.teleopChargingStationCrossesController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
      ],
    );
  }
}
