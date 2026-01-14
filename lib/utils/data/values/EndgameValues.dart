// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EndgameValues {
  /// These don't hold the value of the stopwatch, only properties such as state and the instance
  static final stopwatch = Stopwatch();

  static TextEditingController endgame = TextEditingController(text: "No");
  static TextEditingController climbTime = TextEditingController(text: "0");
  static TextEditingController climbPosition = TextEditingController(text: "No");

  static void resetEndgameValues() {
    EndgameValues.endgame.text = "No"; // was climb, now endgame
    EndgameValues.climbTime.text = "0";
    EndgameValues.climbPosition.text = "No";
    EndgameValues.stopwatch.stop();
    EndgameValues.stopwatch.reset();
  }
}
