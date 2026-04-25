// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

import '../../../utils/fields/FieldRow.dart';

class TeleoperatedFields extends StatelessWidget {
  const TeleoperatedFields({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldRow.fields([
      FieldRegistry.teleopBackToLife,
      FieldRegistry.teleopBeachCounter,
      FieldRegistry.endGameClimb
    ]);
  }
}
