// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousValues {
  static final stopwatch = Stopwatch();

  // auto
  static TextEditingController autoStartPosition =
      TextEditingController(text: "Middle");

  static TextEditingController autoBallScored =
      TextEditingController(text: "0");

  static TextEditingController autoBallPassed =
      TextEditingController(text: "0");

  static TextEditingController autoClimbPosition =
      TextEditingController(text: "None");
  static TextEditingController autoClimbTime = TextEditingController(text: "0");

  static TextEditingController autoClimbHeight =
      TextEditingController(text: "None");

  static TextEditingController numberPadDisplayedValue =
      TextEditingController(text: "");

  static void resetAutoEtcValues() {
    AutonomousValues.autoStartPosition.text = "Middle";
    AutonomousValues.autoClimbPosition.text = "None";
    AutonomousValues.autoClimbTime.text = "0";
    AutonomousValues.autoClimbHeight.text = "None";
    AutonomousValues.numberPadDisplayedValue.text = "";

    AutonomousValues.stopwatch.stop();
    AutonomousValues.stopwatch.reset();
  }

  static void resetAutoBallScored() {
    AutonomousValues.autoBallScored.text = "0";
    AutonomousValues.autoBallPassed.text = "0";
  }
}
