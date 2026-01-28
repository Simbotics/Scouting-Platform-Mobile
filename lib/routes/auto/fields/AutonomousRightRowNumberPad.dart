// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldFactory.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

class AutonomousRightrowNumberPad extends StatelessWidget {
  const AutonomousRightrowNumberPad({super.key});

  @override
  Widget build(BuildContext context) {
    // Build the number-pad field from the central registry.
    return FieldFactory.build(FieldRegistry.autonomousRightRowNumberPad);
  }
}
