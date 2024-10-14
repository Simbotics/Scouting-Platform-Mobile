// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants.dart';

class SettingValues {
  static final TextEditingController currentSelectedCenterfold =
      TextEditingController(text: "none");
  static TextEditingController selectedDriverStation =
      TextEditingController(text: "Red 1");

  static TextEditingController eventID =
      TextEditingController(text: AppConstants.defaultEventID);
  static TextEditingController fileName =
      TextEditingController(text: AppConstants.defaultFileName);

  static String isTeamNumberEditable = "No";
  static bool isTeamNumberReadOnly = true;

  /// Gets the saving spreadhseet name based on the current filename
  static String getCurrentSavingSpreadsheetName() {
    return "${fileName.text}.csv";
  }
}
