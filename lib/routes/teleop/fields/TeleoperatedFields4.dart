// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldFactory.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

class TeleoperatedFields4 extends StatelessWidget {
  const TeleoperatedFields4({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      FieldFactory.build(FieldRegistry.teleopBallsScoredCounter),
      FieldFactory.build(FieldRegistry.teleopBallsPassedCounter),
    ]);
  }
}
