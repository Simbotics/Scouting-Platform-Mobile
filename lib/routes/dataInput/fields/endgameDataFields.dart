// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/fields/counterNumberField.dart';
import 'package:scouting_platform/builders/fields/dropdownMenu.dart';
import 'package:scouting_platform/builders/fields/stopwatchButton.dart';
import 'package:scouting_platform/utils/data/data.dart';

class Row3Fields extends StatefulWidget {
  const Row3Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row3FieldsState createState() => _Row3FieldsState();
}

class _Row3FieldsState extends State<Row3Fields> {
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
        //endgame dropdown
        ScoutingDropdownMenu(
            dropdownMenuSelectedItem: Data.endgame.text,
            onChanged: (value) {
              setState(() {
                Data.endgame.text = value;
              });
            },
            dropdownItems: Data.endgameOptions,
            margin: const EdgeInsets.only(left: 20)),
        //climb time
        StopwatchButton(
          state: Data.stopwatchState,
          timer: Data.stopwatch,
        ),
        //trap
        CounterNumberField(
            controller: Data.trap,
            onTapDecrement: () => decrementNumber(Data.trap),
            onTapIncrement: () => incrementNumber(Data.trap)),
      ],
    );
  }
}
