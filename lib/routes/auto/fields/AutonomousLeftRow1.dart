// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

class AutonomousLeftRow1 extends StatelessWidget {
  const AutonomousLeftRow1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      height: 60,
      child: FieldRow.fields([
        FieldRegistry.autonomousLeftRow1StartPosition,
        FieldRegistry.autonomousLeftRow1Mobility,
      ]),
    );
  }
}
