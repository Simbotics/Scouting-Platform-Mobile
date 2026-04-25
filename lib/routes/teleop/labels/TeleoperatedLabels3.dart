// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';

class TeleoperatedLabels3 extends StatelessWidget {
  const TeleoperatedLabels3({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldRow.labels([
      'Cycles',
      'Stealing',
      'Defense',
    ]);
  }
}
