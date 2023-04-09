// ignore_for_file: file_names
import 'package:flutter/widgets.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE

class TeleopData {
  // Cone scored text controllers
  static final TextEditingController teleopConeLowController =
      TextEditingController(text: "0");
  static final TextEditingController teleopConeMidController =
      TextEditingController(text: "0");
  static final TextEditingController teleopConeHighController =
      TextEditingController(text: "0");
  static final TextEditingController teleopConeMissedController =
      TextEditingController(text: "0");
  static final TextEditingController teleopConeDroppedController =
      TextEditingController(text: "0");

  // Cube scored input controllers
  static final TextEditingController teleopCubeLowController =
      TextEditingController(text: "0");
  static final TextEditingController teleopCubeMidController =
      TextEditingController(text: "0");
  static final TextEditingController teleopCubeHighController =
      TextEditingController(text: "0");
  static final TextEditingController teleopCubeMissedController =
      TextEditingController(text: "0");
  static final TextEditingController teleopCubeDroppedController =
      TextEditingController(text: "0");

  // Teleop balancing data tracking
  static final TextEditingController teleopBalanceTimeController =
      TextEditingController(text: "");
  static final TextEditingController autoBalanceTimeController =
      TextEditingController(text: "");

  // Current balancing values
  static String currentTeleopBalanceState = "No Attempt";
  static String currentTeleopMobility = "No";
}
