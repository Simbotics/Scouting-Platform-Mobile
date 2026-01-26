// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldFactory.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

class TeleoperatedFields3 extends StatelessWidget {
  const TeleoperatedFields3({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      FieldFactory.build(FieldRegistry.teleopClimbTimer),
      FieldFactory.build(FieldRegistry.teleopClimbHeightDropdown),
    ]);
  }
}
