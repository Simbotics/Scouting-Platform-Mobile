// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

import '../../../utils/fields/FieldRow.dart';

class TeleoperatedFields2 extends StatelessWidget {
  const TeleoperatedFields2({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldRow.fields([
      FieldRegistry.teleopRobotDeadDropdown,
      FieldRegistry.teleopClimbPositionDropdown
    ]);
  }
}
