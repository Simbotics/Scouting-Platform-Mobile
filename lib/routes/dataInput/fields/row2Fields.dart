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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //speaker scored
        CounterNumberField(
          onTapIncrement: () {},
          onTapDecrement: () {}, 
          controller: Data.speaker),
        //speaker missed
        CounterNumberField(
          onTapDecrement: () {}, 
          onTapIncrement: () {}, 
          controller: Data.speakerMissed),
        //amp scored
        CounterNumberField(
          onTapDecrement: () {}, 
          onTapIncrement: () {}, 
          controller: Data.amp),
          //amp missed
        CounterNumberField(
          onTapDecrement: () {}, 
          onTapIncrement: () {}, 
          controller: Data.ampMissed),
        ],
    );
  }
}