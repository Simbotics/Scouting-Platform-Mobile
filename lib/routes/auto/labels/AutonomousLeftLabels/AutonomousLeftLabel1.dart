// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';

class AutonomousLeftLabel1 extends StatelessWidget {
  const AutonomousLeftLabel1({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldRow.labels(["Start Position"], leftPadding: 20.0);
  }
}
