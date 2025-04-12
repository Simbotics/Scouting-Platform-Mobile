// ignore_for_file: file_names
import 'dart:ui';

import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
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

  static Future<Color> getAppBarColour() async {
    try {
      if (await Schedulehelper.isTeamInUpcomingMatches(
          int.parse(PrematchValues.teamNumber.text))) {
        return Color.from(alpha: 1, red: 0, green: 0.5, blue: 0);
      } else {
        return AppStyle.textInputColor;
      }
    } catch (e) {
      return AppStyle.textInputColor;
    }
  }

  // Sets the brightness of the screen
  static Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setApplicationScreenBrightness(brightness);
    } catch (e) {
      throw 'Failed to set brightness';
    }
  }
}
