// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EndgameValues {
  /// These don't hold the value of the stopwatch, only properties such as state and the instance
  static final stopwatch = Stopwatch();

  static TextEditingController endGameClimb =
      TextEditingController(text: "Did not attempt");

  static void resetEndgameValues() {
    EndgameValues.endGameClimb.text = "Did not attempt";

    EndgameValues.stopwatch.stop();
    EndgameValues.stopwatch.reset();
  }
}
