// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

class AutonomousLeftRow2 extends StatelessWidget {
  const AutonomousLeftRow2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(),
      height: 60,
      child: FieldRow.fields([
        FieldRegistry.autonomousLeftRow2_ballScored,
      ]),
    );
  }
}
