// ignore_for_file: file_names
import 'dart:developer';

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
          dropdownItems: const ["yes", "no"], 
          margin: const EdgeInsets.only(left: 20)),
        //speaker scored
        CounterNumberField(
          onTapIncrement: () {},
          onTapDecrement: () {}, 
          controller: Data.autoSpeakerScored),
        //speaker missed
        CounterNumberField(
          onTapDecrement: () {}, 
          onTapIncrement: () {}, 
          controller: Data.autoSpeakerMissed),
        //amp scored
        CounterNumberField(
          onTapDecrement: () {}, 
          onTapIncrement: () {}, 
          controller: Data.autoAmpScored),
          //amp missed
        CounterNumberField(
          onTapDecrement: () {}, 
          onTapIncrement: () {}, 
          controller: Data.autoAmpMissed),
        ],
    );
  }
}