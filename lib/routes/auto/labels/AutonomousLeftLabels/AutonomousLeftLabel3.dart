// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';

class AutonomousLeftLabel3 extends StatelessWidget {
  const AutonomousLeftLabel3({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldRow.labels(["Climb Time", "Climb Position"], leftPadding: 20.0);
  }
}
