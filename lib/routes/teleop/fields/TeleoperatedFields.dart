// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';

class TeleoperatedFields extends StatefulWidget {
  const TeleoperatedFields({
    super.key,
  });

  @override
  State<TeleoperatedFields> createState() => _TeleoperatedFieldsState();
}

class _TeleoperatedFieldsState extends State<TeleoperatedFields> {
  /// Increments an integer in a controllers value by one
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //endgame dropdown
        PlatformDropdownMenu(
            dropdownMenuSelectedItem: EndgameValues.climbPosition.text,
            onChanged: (value) {
              setState(() {
                EndgameValues.climbPosition.text = value;
              });
            },
            dropdownItems: OptionConstants.climbPosition,
            margin: const EdgeInsets.only(left: 20)),
      ],
    );
  }
}
