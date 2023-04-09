// ignore_for_file: file_names, duplicate_ignore
import 'package:flutter/widgets.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE

class AutoData {
  // Auto scoring number input fields
  static final TextEditingController autoLowController =
      TextEditingController(text: "0");
  static final TextEditingController autoMidController =
      TextEditingController(text: "0");
  static final TextEditingController autoHighController =
      TextEditingController(text: "0");
  static final TextEditingController autoMissedController =
      TextEditingController(text: "0");
  static final TextEditingController autoDroppedController =
      TextEditingController(text: "0");

  static final TextEditingController teleopBalanceTime =
      TextEditingController(text: "0");
  static final TextEditingController autoBalanceTime =
      TextEditingController(text: "0");

  // Auto current balancing
  static String currentAutoBalanceState = "No Attempt";
  static String currentAutoMobility = "No";

  // Options shown in auto balance dropdown
  static List<String> autoBalanceOptions = [
    'Attempted',
    'No Attempt',
    'Succeeded',
    'Docked'
  ];
}
