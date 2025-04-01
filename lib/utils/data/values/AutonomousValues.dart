// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousValues {
  // other
  static TextEditingController autoStartPosition =
      TextEditingController(text: "");
  static TextEditingController autoMobility = TextEditingController(text: "");
  static TextEditingController coralMissed = TextEditingController(text: "0");
  static TextEditingController algaeRemoved = TextEditingController(text: "0");
  static TextEditingController algaeProcessor =
      TextEditingController(text: "0");
  static TextEditingController algaeBarge = TextEditingController(text: "0");

  // L1 trough sides
  static TextEditingController l1NW = TextEditingController(text: "0");
  static TextEditingController l1NE = TextEditingController(text: "0");
  static TextEditingController l1W = TextEditingController(text: "0");
  static TextEditingController l1E = TextEditingController(text: "0");
  static TextEditingController l1SW = TextEditingController(text: "0");
  static TextEditingController l1SE = TextEditingController(text: "0");

  // L4 trough sides
  static TextEditingController l4A = TextEditingController(text: "0");
  static TextEditingController l4L = TextEditingController(text: "0");
  static TextEditingController l4K = TextEditingController(text: "0");
  static TextEditingController l4J = TextEditingController(text: "0");
  static TextEditingController l4I = TextEditingController(text: "0");
  static TextEditingController l4H = TextEditingController(text: "0");

  static TextEditingController l4B = TextEditingController(text: "0");
  static TextEditingController l4C = TextEditingController(text: "0");
  static TextEditingController l4D = TextEditingController(text: "0");
  static TextEditingController l4E = TextEditingController(text: "0");
  static TextEditingController l4F = TextEditingController(text: "0");
  static TextEditingController l4G = TextEditingController(text: "0");

  // L3 trough sides
  static TextEditingController l3A = TextEditingController(text: "0");
  static TextEditingController l3L = TextEditingController(text: "0");
  static TextEditingController l3K = TextEditingController(text: "0");
  static TextEditingController l3J = TextEditingController(text: "0");
  static TextEditingController l3I = TextEditingController(text: "0");
  static TextEditingController l3H = TextEditingController(text: "0");

  static TextEditingController l3B = TextEditingController(text: "0");
  static TextEditingController l3C = TextEditingController(text: "0");
  static TextEditingController l3D = TextEditingController(text: "0");
  static TextEditingController l3E = TextEditingController(text: "0");
  static TextEditingController l3F = TextEditingController(text: "0");
  static TextEditingController l3G = TextEditingController(text: "0");

  // L2 through sides
  static TextEditingController l2A = TextEditingController(text: "0");
  static TextEditingController l2L = TextEditingController(text: "0");
  static TextEditingController l2K = TextEditingController(text: "0");
  static TextEditingController l2J = TextEditingController(text: "0");
  static TextEditingController l2I = TextEditingController(text: "0");
  static TextEditingController l2H = TextEditingController(text: "0");

  static TextEditingController l2B = TextEditingController(text: "0");
  static TextEditingController l2C = TextEditingController(text: "0");
  static TextEditingController l2D = TextEditingController(text: "0");
  static TextEditingController l2E = TextEditingController(text: "0");
  static TextEditingController l2F = TextEditingController(text: "0");
  static TextEditingController l2G = TextEditingController(text: "0");

  static void resetAutoEtcValues() {
    AutonomousValues.autoStartPosition.text = "";
    AutonomousValues.autoMobility.text = "";
    AutonomousValues.coralMissed.text = "0";
    AutonomousValues.algaeRemoved.text = "0";
    AutonomousValues.algaeBarge.text = "0";
    AutonomousValues.algaeProcessor.text = "0";
  }

  static void resetAutoReef() {
    // tough coral
    AutonomousValues.l1E.text = "0";
    AutonomousValues.l1NE.text = "0";
    AutonomousValues.l1NW.text = "0";
    AutonomousValues.l1SE.text = "0";
    AutonomousValues.l1SW.text = "0";
    AutonomousValues.l1W.text = "0";

    // L2 coral
    AutonomousValues.l2A.text = "0";
    AutonomousValues.l2B.text = "0";
    AutonomousValues.l2C.text = "0";
    AutonomousValues.l2D.text = "0";
    AutonomousValues.l2E.text = "0";
    AutonomousValues.l2F.text = "0";
    AutonomousValues.l2G.text = "0";
    AutonomousValues.l2H.text = "0";
    AutonomousValues.l2I.text = "0";
    AutonomousValues.l2J.text = "0";
    AutonomousValues.l2K.text = "0";
    AutonomousValues.l2L.text = "0";

    // L3 coral
    AutonomousValues.l3A.text = "0";
    AutonomousValues.l3B.text = "0";
    AutonomousValues.l3C.text = "0";
    AutonomousValues.l3D.text = "0";
    AutonomousValues.l3E.text = "0";
    AutonomousValues.l3F.text = "0";
    AutonomousValues.l3G.text = "0";
    AutonomousValues.l3H.text = "0";
    AutonomousValues.l3I.text = "0";
    AutonomousValues.l3J.text = "0";
    AutonomousValues.l3K.text = "0";
    AutonomousValues.l3L.text = "0";

    // L4 coral
    AutonomousValues.l4A.text = "0";
    AutonomousValues.l4B.text = "0";
    AutonomousValues.l4C.text = "0";
    AutonomousValues.l4D.text = "0";
    AutonomousValues.l4E.text = "0";
    AutonomousValues.l4F.text = "0";
    AutonomousValues.l4G.text = "0";
    AutonomousValues.l4H.text = "0";
    AutonomousValues.l4I.text = "0";
    AutonomousValues.l4J.text = "0";
    AutonomousValues.l4K.text = "0";
    AutonomousValues.l4L.text = "0";
  }
}
