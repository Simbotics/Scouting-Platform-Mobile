// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/autoData.dart';
import 'package:scouting_platform/utils/data/teleopData.dart';

import '../../builders/numberFieldWithCounter.dart';
import '../../builders/dropdownMenu.dart';
import '../../builders/numberInputField.dart';

class Row2Fields extends StatefulWidget {
  const Row2Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row2FieldsState createState() => _Row2FieldsState();
}

class _Row2FieldsState extends State<Row2Fields> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // Auto balance dropdown
      ScoutingDropdownMenu(
          margin: const EdgeInsets.only(left: 20),
          width: 130,
          dropdownMenuSelectedItem: AutoData.currentAutoBalanceState,
          onChanged: (value) {
            setState(() {
              AutoData.currentAutoBalanceState = value;
            });
          },
          dropdownItems: AutoData.autoBalanceOptions),
      // Auto mid
      NumberInputFieldWithCounter(
        controller: AutoData.autoMidController,
        onTapIncrement: () {
          int currentValue = int.parse(AutoData.autoMidController.text);
          setState(() {
            currentValue++;
            AutoData.autoMidController.text =
                (currentValue > 0 ? currentValue : 0).toString();
          });
        },
        onTapDecrement: () {
          int currentValue = int.parse(AutoData.autoMidController.text);
          setState(() {
            currentValue--;
            AutoData.autoMidController.text =
                (currentValue > 0 ? currentValue : 0)
                    .toString(); // decrementing value
          });
        },
      ),
      // Teleop cones mid
      NumberInputFieldWithCounter(
        margin: const EdgeInsets.only(left: 83),
        controller: TeleopData.teleopConeMidController,
        onTapIncrement: () {
          int currentValue = int.parse(TeleopData.teleopConeMidController.text);
          setState(() {
            currentValue++;
            TeleopData.teleopConeMidController.text =
                (currentValue > 0 ? currentValue : 0).toString();
          });
        },
        onTapDecrement: () {
          int currentValue = int.parse(TeleopData.teleopConeMidController.text);
          setState(() {
            currentValue--;
            TeleopData.teleopConeMidController.text =
                (currentValue > 0 ? currentValue : 0)
                    .toString(); // decrementing value
          });
        },
      ),
      // Teleop cubes mid
      NumberInputFieldWithCounter(
        controller: TeleopData.teleopCubeMidController,
        onTapIncrement: () {
          int currentValue = int.parse(TeleopData.teleopCubeMidController.text);
          setState(() {
            currentValue++;
            TeleopData.teleopCubeMidController.text =
                (currentValue > 0 ? currentValue : 0).toString();
          });
        },
        onTapDecrement: () {
          int currentValue = int.parse(TeleopData.teleopCubeMidController.text);
          setState(() {
            currentValue--;
            TeleopData.teleopCubeMidController.text =
                (currentValue > 0 ? currentValue : 0)
                    .toString(); // decrementing value
          });
        },
      ),
      // Teleop time to balance
      NumberInputField(
          width: 150,
          margin: const EdgeInsets.only(left: 20.0),
          controller: TeleopData.teleopBalanceTimeController,
          onChanged: (value) {},
          hintText: "Enter Time"),
    ]);
  }
}
