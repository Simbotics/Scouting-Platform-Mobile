// ignore_for_file: file_names
import 'dart:ui';

import 'package:scouting_platform/ui/style/style.dart';
import 'package:screen_brightness/screen_brightness.dart';

class UIUtils {
  /// Gets the background colour for the app
  static Color getBackgroundColour() {
    // TODO: Actually implement this
    return AppStyle.redAlliance;
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
