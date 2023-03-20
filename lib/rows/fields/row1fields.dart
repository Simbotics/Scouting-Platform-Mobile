// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../../builders/numberFieldWithCounter.dart';
import '../../builders/dropdownMenu.dart';
import '../../sections/autoScoutingData.dart';
import '../../sections/teleopScoutingData.dart';

class Row1Fields extends StatefulWidget {
  const Row1Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row1FieldsState createState() => _Row1FieldsState();
}

class _Row1FieldsState extends State<Row1Fields> {
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
        // Auto mobility dropdown
        ScoutingDropdownMenu(
            margin: const EdgeInsets.only(left: 20),
            width: 130,
            dropdownMenuSelectedItem: AutoScoutingData.autoMobility,
            onChanged: (value) {
              setState(() {
                AutoScoutingData.autoMobility = value;
              });
            },
            dropdownItems: yesNoOptions),
        // Auto high
        NumberInputFieldWithCounter(
          controller: AutoScoutingData.autoHighController,
          onTapIncrement: () {
            int currentValue =
                int.parse(AutoScoutingData.autoHighController.text);
            setState(() {
              currentValue++;
              AutoScoutingData.autoHighController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(AutoScoutingData.autoHighController.text);
            setState(() {
              currentValue--;
              AutoScoutingData.autoHighController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cones high
        NumberInputFieldWithCounter(
          margin: const EdgeInsets.only(left: 83.0),
          controller: TeleopScoutingData.teleopConeHighController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopConeHighController.text);
            setState(() {
              currentValue++;
              TeleopScoutingData.teleopConeHighController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopConeHighController.text);
            setState(() {
              currentValue--;
              TeleopScoutingData.teleopConeHighController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop cubes high
        NumberInputFieldWithCounter(
          controller: TeleopScoutingData.teleopCubeHighController,
          onTapIncrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopCubeHighController.text);
            setState(() {
              currentValue++;
              TeleopScoutingData.teleopCubeHighController.text =
                  (currentValue > 0 ? currentValue : 0).toString();
            });
          },
          onTapDecrement: () {
            int currentValue =
                int.parse(TeleopScoutingData.teleopCubeHighController.text);
            setState(() {
              currentValue--;
              TeleopScoutingData.teleopCubeHighController.text =
                  (currentValue > 0 ? currentValue : 0)
                      .toString(); // decrementing value
            });
          },
        ),
        // Teleop balance dropdown
        ScoutingDropdownMenu(
            margin: const EdgeInsets.only(left: 20, right: 10),
            width: 150,
            dropdownMenuSelectedItem: TeleopScoutingData.teleopBalance,
            onChanged: (value) {
              setState(() {
                TeleopScoutingData.teleopBalance = value;
              });
            },
            dropdownItems: AutoScoutingData.balanceOptions),
      ],
    );
  }
}
