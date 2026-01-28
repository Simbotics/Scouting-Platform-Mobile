// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldFactory.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';

class TeleoperatedRightRowNumberPad extends StatelessWidget {
  const TeleoperatedRightRowNumberPad({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldFactory.build(FieldRegistry.teleopNumberPad);
  }
}
