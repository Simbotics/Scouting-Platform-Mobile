// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TeleoperatedValues {
  static final stopwatch = Stopwatch();

  static TextEditingController ballsScored = TextEditingController(text: "0");
  static TextEditingController defenseTime = TextEditingController(text: "0");
  static TextEditingController numberPadDisplayedValue =
      TextEditingController(text: "");
  static TextEditingController ballsPassed = TextEditingController(text: "0");

  static void resetTeleopValues() {
    TeleoperatedValues.ballsScored.text = "0";
    TeleoperatedValues.defenseTime.text = "0";
    TeleoperatedValues.numberPadDisplayedValue.text = "";
    TeleoperatedValues.ballsPassed = TextEditingController(text: "0");

    TeleoperatedValues.stopwatch.stop();
    TeleoperatedValues.stopwatch.reset();
  }
}
