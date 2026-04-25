// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

import '../../../utils/fields/FieldRow.dart';

class TeleoperatedFields3 extends StatelessWidget {
  const TeleoperatedFields3({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldRow.fields([
      FieldRegistry.teleopCycles,
      FieldRegistry.teleopStealing,
      FieldRegistry.teleopDefence
    ]);
  }
}
