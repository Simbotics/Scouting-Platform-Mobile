// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TeleoperatedValues {
  static final stopwatch = Stopwatch();

  static TextEditingController coralL1 = TextEditingController(text: "0");
  static TextEditingController coralL2 = TextEditingController(text: "0");
  static TextEditingController coralL3 = TextEditingController(text: "0");
  static TextEditingController coralL4 = TextEditingController(text: "0");
  static TextEditingController coralMissed = TextEditingController(text: "0");
  static TextEditingController algaeRemoved = TextEditingController(text: "0");
  static TextEditingController algaeProcessor =
      TextEditingController(text: "0");
  static TextEditingController algaeBarge = TextEditingController(text: "0");
  static TextEditingController defenseTime = TextEditingController(text: "0");

  static void resetTeleopValues() {
    TeleoperatedValues.coralL1.text = "0";
    TeleoperatedValues.coralL2.text = "0";
    TeleoperatedValues.coralL3.text = "0";
    TeleoperatedValues.coralL4.text = "0";
    TeleoperatedValues.coralMissed.text = "0";
    TeleoperatedValues.algaeRemoved.text = "0";
    TeleoperatedValues.algaeProcessor.text = "0";
    TeleoperatedValues.algaeBarge.text = "0";
    TeleoperatedValues.defenseTime.text = "0";
  }
}
