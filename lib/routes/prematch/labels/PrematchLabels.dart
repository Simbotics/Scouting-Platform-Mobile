// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';
import 'package:scouting_platform/routes/auto/AutonomousDataRoute.dart';

class PrematchLabels extends StatelessWidget {
  const PrematchLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldRow.labels(
      ['Initials', 'Match Number', 'Team Number'],
      buttonLabel: 'Auto >',
      labelMargins: [EdgeInsets.only(left:20), EdgeInsets.only(left:55), EdgeInsets.only(left:105)],
      routeBuilder: () => const AutonomousDataRoute(title: "Auto"),
    );
  }
}
