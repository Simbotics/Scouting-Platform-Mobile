// ignore_for_file: file_names
import 'package:flutter/material.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE
class Data {
  static final yesNoOptions = ["yes", "no"];
  // Create files like these to store certain variables such as team numbers, match numbers, etc.
  // This is just a placeholder file and is to be deleted as this is just an example.
  //auto
  static TextEditingController autoMobility = TextEditingController(text:"no");
  static TextEditingController autoSpeakerScored = TextEditingController(text: "0");
  static TextEditingController autoSpeakerMissed = TextEditingController(text: "0");
  static TextEditingController autoAmpScored = TextEditingController(text: "0");
  static TextEditingController autoAmpMissed = TextEditingController(text: "0");

  //teleop
  static TextEditingController speaker = TextEditingController(text: "0");
  static TextEditingController speakerMissed = TextEditingController(text: "0");
  static TextEditingController amp = TextEditingController(text: "0");
  static TextEditingController ampMissed = TextEditingController(text: "0");
  static TextEditingController climb = TextEditingController(text: "no");
  static TextEditingController climbTime = TextEditingController(text: "0");
  static TextEditingController trap = TextEditingController(text: "0");
  static TextEditingController spotlight = TextEditingController(text: "no");
}
