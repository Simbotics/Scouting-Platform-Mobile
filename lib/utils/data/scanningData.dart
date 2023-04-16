// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE

class ScanningData {
  static List<String> unscannedDevices = ['0', '1', '2', '3', '4', '5'];
  static List<String> scannedDevices = [];

  static String currentSavingSpreadsheetName = "2023-Houston-Worlds.csv";

  static final TextEditingController currentSavingSpreadsheetNameController =
      TextEditingController(text: "2023-Houston-Worlds");
}
