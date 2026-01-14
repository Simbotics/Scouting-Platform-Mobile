// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousValues {
  static final stopwatch = Stopwatch();

  // auto
  static TextEditingController autoStartPosition =
      TextEditingController(text: "Center");
  static TextEditingController autoMobility = TextEditingController(text: "No");

  static TextEditingController autoBallScored =
      TextEditingController(text: "0");

  static TextEditingController autoClimbPosition =
      TextEditingController(text: "No");
  static TextEditingController autoClimbTime = TextEditingController(text: "0");

  static TextEditingController numberPadDisplayedValue =
      TextEditingController(text: "");

  static void resetAutoEtcValues() {
    AutonomousValues.autoStartPosition.text = "Center";
    AutonomousValues.autoMobility.text = "No";
    AutonomousValues.autoClimbPosition.text = "No";
    AutonomousValues.autoClimbTime.text = "0";
    AutonomousValues.numberPadDisplayedValue.text = "";
  }

  static void resetAutoBallScored() {
    AutonomousValues.autoBallScored.text = "0";
  }
}
