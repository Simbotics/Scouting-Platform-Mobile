// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldFactory.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

class TeleoperatedFields extends StatelessWidget {
  const TeleoperatedFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [FieldFactory.build(FieldRegistry.teleopDefenseTimer)]);
  }
}
