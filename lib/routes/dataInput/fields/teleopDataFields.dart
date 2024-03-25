// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/fields/counterNumberField.dart';
import 'package:scouting_platform/utils/data/data.dart';

class Row2Fields extends StatefulWidget {
  const Row2Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row2FieldsState createState() => _Row2FieldsState();
}

class _Row2FieldsState extends State<Row2Fields> {
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
        //speaker scored
        CounterNumberField(
            controller: Data.speaker,
            onTapDecrement: () => decrementNumber(Data.speaker),
            onTapIncrement: () => incrementNumber(Data.speaker)),
        //speaker missed
        CounterNumberField(
            controller: Data.speakerMissed,
            onTapDecrement: () => decrementNumber(Data.speakerMissed),
            onTapIncrement: () => incrementNumber(Data.speakerMissed)),
        //amp scored
        CounterNumberField(
            controller: Data.amp,
            onTapDecrement: () => decrementNumber(Data.amp),
            onTapIncrement: () => incrementNumber(Data.amp)),
        //amp missed
        CounterNumberField(
            controller: Data.ampMissed,
            onTapDecrement: () => decrementNumber(Data.ampMissed),
            onTapIncrement: () => incrementNumber(Data.ampMissed)),
        //passes
        CounterNumberField(
            controller: Data.passes,
            onTapDecrement: () => decrementNumber(Data.passes),
            onTapIncrement: () => incrementNumber(Data.passes)),
      ],
    );
  }
}
