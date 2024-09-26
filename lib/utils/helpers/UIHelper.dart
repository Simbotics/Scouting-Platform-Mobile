// ignore_for_file: file_names
import 'dart:ui';

import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:screen_brightness/screen_brightness.dart';

class UIHelper {
  /// Gets the background colour for the app
  static Color getBackgroundColour() {
    if (SettingValues.selectedDriverStation.text.contains("Red")) {
      return AppStyle.redAlliance;
    } else {
      return AppStyle.blueAlliance;
    }
  }

  // Sets the brightness of the screen
  static Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      throw 'Failed to set brightness';
    }
  }
}
