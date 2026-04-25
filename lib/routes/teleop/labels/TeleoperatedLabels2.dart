// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';

class TeleoperatedLabels2 extends StatelessWidget {
  const TeleoperatedLabels2({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldRow.labels(['Got Defended', 'Broken', 'Dead']);
  }
}
