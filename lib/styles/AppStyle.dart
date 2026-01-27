// ignore_for_file: file_names
import 'package:flutter/material.dart';

// Contains all colour styles used within the app
class AppStyle {
  // Alliance colour (background based off of this)
  static const Color redAlliance = Color.fromARGB(255, 180, 21, 11);
  static const Color blueAlliance = Color.fromARGB(199, 26, 17, 141);

  // Input field colours
  static const Color textInputColor = Color(0xFF404040);
  static const Color textInputColorLight = Color.fromARGB(255, 83, 83, 83);
  
  // General surface/background
  static const Color scaffoldBackground = Color(0xFF222222);
  static const Color cardBackground = Color(0xFF2E2E2E);
  static const Color accent = Color(0xFFB4150B);

  // Text styles
  static const TextStyle headerText = TextStyle(fontFamily: 'Futura', color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);
}
