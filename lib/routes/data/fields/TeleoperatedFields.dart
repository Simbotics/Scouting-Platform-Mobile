// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class TeleoperatedFields extends StatefulWidget {
  const TeleoperatedFields({
    super.key,
  });

  @override
  State<TeleoperatedFields> createState() => _TeleoperatedFieldsState();
}

class _TeleoperatedFieldsState extends State<TeleoperatedFields> {
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
        //speaker scored
        CounterNumberField(
            controller: TeleoperatedValues.speaker,
            onTapDecrement: () => decrementNumber(TeleoperatedValues.speaker),
            onTapIncrement: () => incrementNumber(TeleoperatedValues.speaker)),
        //speaker missed
        CounterNumberField(
            controller: TeleoperatedValues.speakerMissed,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.speakerMissed),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.speakerMissed)),
        //amp scored
        CounterNumberField(
            controller: TeleoperatedValues.amp,
            onTapDecrement: () => decrementNumber(TeleoperatedValues.amp),
            onTapIncrement: () => incrementNumber(TeleoperatedValues.amp)),
        //amp missed
        CounterNumberField(
            controller: TeleoperatedValues.ampMissed,
            onTapDecrement: () => decrementNumber(TeleoperatedValues.ampMissed),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.ampMissed)),
        //passes
        CounterNumberField(
            controller: TeleoperatedValues.passes,
            onTapDecrement: () => decrementNumber(TeleoperatedValues.passes),
            onTapIncrement: () => incrementNumber(TeleoperatedValues.passes)),
      ],
    );
  }
}
