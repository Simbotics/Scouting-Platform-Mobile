// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/autoData.dart';
import 'package:scouting_platform/utils/data/teleopData.dart';

import '../../builders/numberFieldWithCounter.dart';
import '../../builders/dropdownMenu.dart';

class Row1Fields extends StatefulWidget {
  const Row1Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row1FieldsState createState() => _Row1FieldsState();
}

class _Row1FieldsState extends State<Row1Fields> {
  // Dropdown menu options
  final List<String> yesNoOptions = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Auto mobility dropdown
        ScoutingDropdownMenu(
            margin: const EdgeInsets.only(left: 20),
            width: 130,
            dropdownMenuSelectedItem: AutoData.currentAutoMobility,
            onChanged: (value) {
              setState(() {
                AutoData.currentAutoMobility = value;
              });
            },
            dropdownItems: yesNoOptions),
        // Auto high
        NumberInputFieldWithCounter(
          controller: AutoData.autoHighController,
          onTapIncrement: () {
            int currentValue = int.parse(AutoData.autoHighController.text);
            setState(() {
              currentValue++;
              AutoData.autoHighController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue = int.parse(AutoData.autoHighController.text);
            setState(() {
              currentValue--;
              AutoData.autoHighController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cones high
        NumberInputFieldWithCounter(
          margin: const EdgeInsets.only(left: 83.0),
          controller: TeleopData.teleopConeHighController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopData.teleopConeHighController.text);
            setState(() {
              currentValue++;
              TeleopData.teleopConeHighController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopData.teleopConeHighController.text);
            setState(() {
              currentValue--;
              TeleopData.teleopConeHighController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cubes high
        NumberInputFieldWithCounter(
          controller: TeleopData.teleopCubeHighController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopData.teleopCubeHighController.text);
            setState(() {
              currentValue++;
              TeleopData.teleopCubeHighController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopData.teleopCubeHighController.text);
            setState(() {
              currentValue--;
              TeleopData.teleopCubeHighController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop balance dropdown
        ScoutingDropdownMenu(
            margin: const EdgeInsets.only(left: 20, right: 10),
            width: 150,
            dropdownMenuSelectedItem: TeleopData.currentTeleopBalanceState,
            onChanged: (value) {
              setState(() {
                TeleopData.currentTeleopBalanceState = value;
              });
            },
            dropdownItems: AutoData.autoBalanceOptions),
      ],
    );
  }
}
