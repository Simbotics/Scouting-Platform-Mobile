// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EndgameValues {
  /// These don't hold the value of the stopwatch, only properties such as state and the instance
  static final stopwatch = Stopwatch();

  static TextEditingController endgame = TextEditingController(text: "");
  static TextEditingController climbTime = TextEditingController(text: "0");

  static void resetEndgameValues() {
    EndgameValues.endgame.text = ""; // was climb, now endgame
    EndgameValues.climbTime.text = "0"; // parked was below
    EndgameValues.stopwatch.stop();
    EndgameValues.stopwatch.reset();
  }
}
