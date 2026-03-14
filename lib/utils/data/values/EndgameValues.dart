// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EndgameValues {
  /// These don't hold the value of the stopwatch, only properties such as state and the instance
  static final stopwatch = Stopwatch();

  static TextEditingController climbHeight =
      TextEditingController(text: "None");
  static TextEditingController climbTime = TextEditingController(text: "0");
  static TextEditingController climbPosition =
      TextEditingController(text: "None");

  static void resetEndgameValues() {
    EndgameValues.climbHeight.text = "None"; // was climb, now endgame
    EndgameValues.climbTime.text = "0";
    EndgameValues.climbPosition.text = "None";
    EndgameValues.stopwatch.stop();
    EndgameValues.stopwatch.reset();
  }
}
