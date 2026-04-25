// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TeleoperatedValues {
  static final stopwatch = Stopwatch();

  static TextEditingController teleopScoring =
      TextEditingController(text: "No");
  static TextEditingController teleopPassing =
      TextEditingController(text: "No");
  static TextEditingController teleopCleanUp =
      TextEditingController(text: "No");
  static TextEditingController teleopCycles = TextEditingController(text: "No");
  static TextEditingController teleopStealing =
      TextEditingController(text: "No");
  static TextEditingController teleopDefence =
      TextEditingController(text: "No");
  static TextEditingController teleopGetDefended =
      TextEditingController(text: "No");
  static TextEditingController teleopBroken = TextEditingController(text: "No");
  static TextEditingController teleopDead = TextEditingController(text: "No");
  static TextEditingController teleopBackToLife =
      TextEditingController(text: "No");
  static TextEditingController teleopBeachCount =
      TextEditingController(text: "0");

  static void resetTeleopValues() {
    TeleoperatedValues.teleopScoring.text = "No";
    TeleoperatedValues.teleopPassing.text = "No";
    TeleoperatedValues.teleopCleanUp.text = "No";
    TeleoperatedValues.teleopCycles.text = "No";
    TeleoperatedValues.teleopStealing.text = "No";
    TeleoperatedValues.teleopDefence.text = "No";
    TeleoperatedValues.teleopGetDefended.text = "No";
    TeleoperatedValues.teleopBroken.text = "No";
    TeleoperatedValues.teleopDead.text = "No";
    TeleoperatedValues.teleopBackToLife.text = "No";
    TeleoperatedValues.teleopBeachCount.text = "0";

    TeleoperatedValues.stopwatch.stop();
    TeleoperatedValues.stopwatch.reset();
  }
}
