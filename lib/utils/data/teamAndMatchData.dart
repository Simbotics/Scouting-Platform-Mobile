// ignore_for_file: file_names
import 'package:flutter/widgets.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE

class TeamAndMatchData {
  // Team and match info number input fields
  static final TextEditingController initialsController =
      TextEditingController(text: "");
  static final TextEditingController matchNumberController =
      TextEditingController(text: "");
  static final TextEditingController teamNumberController =
      TextEditingController(text: "");

  // Alliance colour (tracked with variable because it isn't constantly updated)
  static String teamAlliance = "Red";

  // Is team number editable (yes or no)
  static String isTeamNumberEditable = "No";
  static bool isTeamNumberReadOnly = true;

  // Colours available to select from the dropdown
  static final List<String> allianceDropdownOptions = ['Blue', 'Red'];

  static final List<String> yesNoOptions = ['Yes', 'No'];
}
