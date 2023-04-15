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

  // Colours available to select from the dropdown
  final List<String> allianceDropdownOptions = ['Blue', 'Red'];
}
