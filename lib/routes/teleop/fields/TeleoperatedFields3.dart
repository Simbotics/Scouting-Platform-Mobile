// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/StopwatchButton.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';


class TeleoperatedFields3 extends StatefulWidget {
  const TeleoperatedFields3({
    super.key,
  });

  @override
  State<TeleoperatedFields3> createState() => _TeleoperatedFields3State();
}

class _TeleoperatedFields3State extends State<TeleoperatedFields3> {
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
        //climb time
        StopwatchButton(
          value: EndgameValues.climbTime,
          timer: EndgameValues.stopwatch,
        ),
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
        
      ],
    );
  }
}
