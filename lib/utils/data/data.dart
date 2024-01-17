// ignore_for_file: file_names
import 'package:flutter/material.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE
class Data {
  // Create files like these to store certain variables such as team numbers, match numbers, etc.
  // This is just a placeholder file and is to be deleted as this is just an example.
  //auto
  static TextEditingController autoMobility = TextEditingController(text:"yes");
  static String mobility = "no";
  static final autoSpeakerScored = TextEditingController(text: "0");
  static double aSpeakerScored = 0.0;
  static final TextEditingController autoSpeakerMissed = TextEditingController(text: "0");
  static final TextEditingController autoAmpScored = TextEditingController(text: "0");
  static final TextEditingController autoAmpMissed = TextEditingController(text: "0");

  //teleop
  static final TextEditingController speaker = TextEditingController(text: "0");
  static final TextEditingController speakerMissed = TextEditingController(text: "0");
  static final TextEditingController amp = TextEditingController(text: "0");
  static final TextEditingController ampMissed = TextEditingController(text: "0");
  static final TextEditingController climb = TextEditingController(text: "0");
  static String sClimb = "no";
  static final TextEditingController climbTime = TextEditingController(text: "0");
  static final TextEditingController trap = TextEditingController(text: "0");
  static final TextEditingController spotlight = TextEditingController(text: "0");
  static String sSpotlight = "no";
}
