// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

class AutonomousLeftRow3 extends StatelessWidget {
  const AutonomousLeftRow3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      height: 60,
      child: FieldRow.fields([
        FieldRegistry.autonomousLeftRow3_stopwatch,
        FieldRegistry.autonomousLeftRow3_climbPosition,
      ], alignment: MainAxisAlignment.start),
    );
  }
}
