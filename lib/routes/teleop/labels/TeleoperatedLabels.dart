// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';

class TeleoperatedLabels extends StatelessWidget {
  const TeleoperatedLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldRow.labels(['Climb Height']);
  }
}
