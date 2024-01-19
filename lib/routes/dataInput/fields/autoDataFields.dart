// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/fields/counterNumberField.dart';
import 'package:scouting_platform/builders/fields/dropdownMenu.dart';
import 'package:scouting_platform/utils/data/data.dart';

class Row1Fields extends StatefulWidget {
  const Row1Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row1FieldsState createState() => _Row1FieldsState();
}

class _Row1FieldsState extends State<Row1Fields> {

  /**
   * Increments an integer in a controllers value by one
   */
  void incrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue++;
      controller.text = currentValue.toString();
    });
  }

  /**
   * Decrements an integer in a controllers value by one unless it's 0
   */
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
        ScoutingDropdownMenu(
            dropdownMenuSelectedItem: Data.autoMobility.text,
            onChanged: (value) {
              setState(() {
                Data.autoMobility.text = value;
              });
            },
            dropdownItems: Data.yesNoOptions,
            margin: const EdgeInsets.only(left: 20)),
        //speaker scored
        CounterNumberField(
            controller: Data.autoSpeakerScored,
            onTapDecrement: () => decrementNumber(Data.autoSpeakerScored),
            onTapIncrement: () => incrementNumber(Data.autoSpeakerScored)),
        //speaker missed
        CounterNumberField(
            controller: Data.autoSpeakerMissed,
            onTapDecrement: () => decrementNumber(Data.autoSpeakerMissed),
            onTapIncrement: () => incrementNumber(Data.autoSpeakerMissed)),
        //amp scored
        CounterNumberField(
            controller: Data.autoAmpScored,
            onTapDecrement: () => decrementNumber(Data.autoAmpScored),
            onTapIncrement: () => incrementNumber(Data.autoAmpScored)),
        //amp missed
        CounterNumberField(
            controller: Data.autoAmpMissed,
            onTapDecrement: () => decrementNumber(Data.autoAmpMissed),
            onTapIncrement: () => incrementNumber(Data.autoAmpMissed)),
      ],
    );
  }
}
