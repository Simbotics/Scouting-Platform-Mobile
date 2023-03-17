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

class Row3Fields extends StatefulWidget {
  const Row3Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row3FieldsState createState() => _Row3FieldsState();
}

class _Row3FieldsState extends State<Row3Fields> {
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
        // Auto time to balance stopwatch button
        NumberInputField(
            width: 130,
            margin: const EdgeInsets.only(left: 20.0),
            controller: TeleopScoutingData.autoBalanceTimeController,
            hintText: "Enter Time"),
        // Auto low
        NumberInputFieldWithCounter(
          controller: AutoScoutingData.autoLowController,
          onTapIncrement: () {
            int currentValue =
                int.parse(AutoScoutingData.autoLowController.text);
            setState(() {
              currentValue++;
              AutoScoutingData.autoLowController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(AutoScoutingData.autoLowController.text);
            setState(() {
              currentValue--;
              AutoScoutingData.autoLowController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cones low
        NumberInputFieldWithCounter(
          margin: const EdgeInsets.only(left: 83),
          controller: TeleopScoutingData.teleopConeLowController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopConeLowController.text);
            setState(() {
              currentValue++;
              TeleopScoutingData.teleopConeLowController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopConeLowController.text);
            setState(() {
              currentValue--;
              TeleopScoutingData.teleopConeLowController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cubes low
        NumberInputFieldWithCounter(
          controller: TeleopScoutingData.teleopCubeLowController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopCubeLowController.text);
            setState(() {
              currentValue++;
              TeleopScoutingData.teleopCubeLowController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopCubeLowController.text);
            setState(() {
              currentValue--;
              TeleopScoutingData.teleopCubeLowController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cubes dropped
        NumberInputFieldWithCounter(
          controller: TeleopScoutingData.teleopCubeDroppedController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopCubeDroppedController.text);
            setState(() {
              currentValue++;
              TeleopScoutingData.teleopCubeDroppedController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopCubeDroppedController.text);
            setState(() {
              currentValue--;
              TeleopScoutingData.teleopCubeDroppedController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
      ],
    );
  }
}
