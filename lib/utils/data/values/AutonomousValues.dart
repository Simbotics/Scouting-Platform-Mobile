// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousValues {
  static final stopwatch = Stopwatch();

  // auto
  static TextEditingController autoStartPosition =
      TextEditingController(text: "Trench");

  static TextEditingController autoPath = TextEditingController(text: "None");

  static TextEditingController autoSweep = TextEditingController(text: "None");

  static TextEditingController autoClimb = TextEditingController(text: "No");

  static TextEditingController autoBeachCount =
      TextEditingController(text: "0");

  static void resetAutoEtcValues() {
    AutonomousValues.autoStartPosition.text = "Trench";
    AutonomousValues.autoPath.text = "None";
    AutonomousValues.autoSweep.text = "None";
    AutonomousValues.autoClimb.text = "No";
    AutonomousValues.autoBeachCount.text = "0";

    AutonomousValues.stopwatch.stop();
    AutonomousValues.stopwatch.reset();
  }
}
