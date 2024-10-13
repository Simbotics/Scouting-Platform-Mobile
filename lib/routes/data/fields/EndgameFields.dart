// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/builders/bases/StopwatchButton.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';

class EndgameFields extends StatefulWidget {
  const EndgameFields({
    super.key,
  });

  @override
  State<EndgameFields> createState() => _EndgameFieldsState();
}

class _EndgameFieldsState extends State<EndgameFields> {
  /// Increments an integer in a controllers value by one
  void incrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue++;
      controller.text = currentValue.toString();
    });
  }

  /// Decrements an integer in a controllers value by one unless it's 0
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
        PlatformDropdownMenu(
            dropdownMenuSelectedItem: EndgameValues.endgame.text,
            onChanged: (value) {
              setState(() {
                EndgameValues.endgame.text = value;
              });
            },
            dropdownItems: OptionConstants.endgameOptions,
            margin: const EdgeInsets.only(left: 20)),
        //climb time
        StopwatchButton(
          value: EndgameValues.climbTime,
          state: EndgameValues.stopwatchState,
          timer: EndgameValues.stopwatch,
        ),
        //trap
        CounterNumberField(
            controller: EndgameValues.trap,
            onTapDecrement: () => decrementNumber(EndgameValues.trap),
            onTapIncrement: () => incrementNumber(EndgameValues.trap)),
      ],
    );
  }
}
