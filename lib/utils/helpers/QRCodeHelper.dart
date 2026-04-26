// ignore_for_file: file_names
import 'dart:convert';

import 'package:scouting_platform/utils/data/constants/AppConstants.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/utils/data/values/CommentValues.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';
import 'package:scouting_platform/utils/helpers/AppDataHelper.dart';

class QrcodeHelper {
  /// Returns a string that represents the contents of the QR code that will be generated and separates them with a "^" character
  static String getQRCodeString() {
    var computedValues = computeValues([
      computeBatteryLevel(),
      computePrematchValues(),
      computeAutonomousValues(),
      computeTeleopValues(),
      computeEndgameValues(),
      computeCommentValues()
      // computeSuffixValues()
    ]);

    // ignore: avoid_print
    if (AppConstants.isDebug) print(computedValues);

    // Encode to UTF-8 and then base64 to compress size and reduce issues with characters
    List<int> utf8Encoded = utf8.encode(computedValues);

    AppDataHelper.saveQRCodeCopy(computedValues);

    return base64.encode(utf8Encoded);
  }

  static String computeBatteryLevel() {
    return computeValues([parseInt(SettingValues.batteryLevel.text)]);
  }

  /// Computes all prematch values and returns them as a single string separated by a caret
  static String computePrematchValues() {
    return computeValues([
      parseInt(PrematchValues.teamNumber.text), // index: 0
      parseInt(PrematchValues.matchNumber.text), // index: 1
      parseString(PrematchValues.initials.text), // index: 2
      parseString(SettingValues.selectedDriverStation.text) // index: 3
    ]);
  }

  /// Computes all autonomous values and returns them as a single string separated by a caret
  static String computeAutonomousValues() {
    return computeValues([
      // other
      parseString(AutonomousValues.autoStartPosition.text), // index 4
      parseString(AutonomousValues.autoPath.text), // index 5
      parseString(AutonomousValues.autoSweep.text), // index 6
      parseString(AutonomousValues.autoClimb.text), // index 8
      parseInt(AutonomousValues.autoBeachCount.text), // index 8 // index 7
    ]);
  }

  // Computes all teleoperated values and returns them as a single string separated by a caret
  static String computeTeleopValues() {
    return computeValues([
      parseString(TeleoperatedValues.teleopScoring.text), // index 9
      parseString(TeleoperatedValues.teleopPassing.text), // index 10
      parseString(TeleoperatedValues.teleopCleanUp.text),
      parseString(TeleoperatedValues.teleopCycles.text),
      parseString(TeleoperatedValues.teleopStealing.text),
      parseString(TeleoperatedValues.teleopDefence.text),
      parseString(TeleoperatedValues.teleopGetDefended.text),
      parseString(TeleoperatedValues.teleopBroken.text),
      parseString(TeleoperatedValues.teleopDead.text),
      parseString(TeleoperatedValues.teleopBackToLife.text),
      parseInt(TeleoperatedValues.teleopBeachCount.text), // index 11
    ]);
  }

  /// Computes all endgame values and returns them as a single string separated by a caret
  static String computeEndgameValues() {
    return computeValues([
      parseString(EndgameValues.endGameClimb.text), // index 12
      parseString(EndgameValues.endGameClimb.text), // index 12
    ]);
  }

  /// Computes all comment values and returns them as a single string separated by a caret
  static String computeCommentValues() {
    return computeValues([
      parseString(stripEmoji(CommentValues.autoComments.text)), // index 15
      parseString(stripEmoji(CommentValues.teleopComments.text)), // index 16
      parseInt(
          (double.parse(CommentValues.effectiveness.text).round().toString())),
      parseInt(
          double.parse(CommentValues.aura.text).round().toString()) //index 17

      /// index 18
    ]);
  }

  /// Suffix's are only used for internal app usage only, they are not to be used for actual data that is stored on the CSV
  static String computeSuffixValues() {
    return computeValues([
      parseString(OptionConstants.availableDriverstations
          .indexOf(SettingValues.selectedDriverStation.text)
          .toString()) // index: 73
    ]);
  }

  /// Computes a list of strings and separates them with a caret and returns the resulting string
  static String computeValues(List<String> values) {
    return values.join("^");
  }

  /// Parses a string and removes any newline characters to prevent issues with the encoding and QR code storing
  static String parseString(String value) {
    return value.replaceAll("\n", "");
  }

  /// Parses an integer and returns it as a string, if the integer is null then it returns "0"
  static String parseInt(String value) {
    return (int.tryParse(value) ?? 0).toString();
  }

  /// Removes any character that is not a letter, number, whitespace or a special character
  static String stripEmoji(String value) {
    return value.replaceAll(
        RegExp("[^A-z0-9.,\\-';/?!()[\\]+=\\s@#\$%&*~]"), '');
  }
}
