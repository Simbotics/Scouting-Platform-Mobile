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

class Row2Fields extends StatefulWidget {
  const Row2Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row2FieldsState createState() => _Row2FieldsState();
}

class _Row2FieldsState extends State<Row2Fields> {
  @override
  void initState() {
    super.initState();
  }

  // Dropdown menu options
  final List<String> yesNoOptions = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // Auto balance dropdown
      ScoutingDropdownMenu(
          margin: const EdgeInsets.only(left: 20),
          width: 130,
          dropdownMenuSelectedItem: AutoScoutingData.autoBalance,
          onChanged: (value) {
            setState(() {
              AutoScoutingData.autoBalance = value;
            });
          },
          dropdownItems: AutoScoutingData.balanceOptions),
      // Auto mid
      NumberInputFieldWithCounter(
        controller: AutoScoutingData.autoMidController,
        onTapIncrement: () {
          int currentValue = int.parse(AutoScoutingData.autoMidController.text);
          setState(() {
            currentValue++;
            AutoScoutingData.autoMidController.text =
                (currentValue > 0 ? currentValue : 0).toString();
          });
        },
        onTapDecrement: () {
          int currentValue = int.parse(AutoScoutingData.autoMidController.text);
          setState(() {
            currentValue--;
            AutoScoutingData.autoMidController.text =
                (currentValue > 0 ? currentValue : 0)
                    .toString(); // decrementing value
          });
        },
      ),
      // Teleop cones mid
      NumberInputFieldWithCounter(
        margin: const EdgeInsets.only(left: 83),
        controller: TeleopScoutingData.teleopConeMidController,
        onTapIncrement: () {
          int currentValue =
              int.parse(TeleopScoutingData.teleopConeMidController.text);
          setState(() {
            currentValue++;
            TeleopScoutingData.teleopConeMidController.text =
                (currentValue > 0 ? currentValue : 0).toString();
          });
        },
        onTapDecrement: () {
          int currentValue =
              int.parse(TeleopScoutingData.teleopConeMidController.text);
          setState(() {
            currentValue--;
            TeleopScoutingData.teleopConeMidController.text =
                (currentValue > 0 ? currentValue : 0)
                    .toString(); // decrementing value
          });
        },
      ),
      // Teleop cubes mid
      NumberInputFieldWithCounter(
        controller: TeleopScoutingData.teleopCubeMidController,
        onTapIncrement: () {
          int currentValue =
              int.parse(TeleopScoutingData.teleopCubeMidController.text);
          setState(() {
            currentValue++;
            TeleopScoutingData.teleopCubeMidController.text =
                (currentValue > 0 ? currentValue : 0).toString();
          });
        },
        onTapDecrement: () {
          int currentValue =
              int.parse(TeleopScoutingData.teleopCubeMidController.text);
          setState(() {
            currentValue--;
            TeleopScoutingData.teleopCubeMidController.text =
                (currentValue > 0 ? currentValue : 0)
                    .toString(); // decrementing value
          });
        },
      ),
      // Teleop time to balance
      NumberInputField(
          width: 150,
          margin: const EdgeInsets.only(left: 20.0),
          controller: TeleopScoutingData.teleopBalanceTimeController,
          hintText: "Enter Time"),
    ]);
  }
}
