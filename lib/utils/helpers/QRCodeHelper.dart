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
      parseString(AutonomousValues.autoMobility.text), // index 5
      parseInt(AutonomousValues.coralMissed.text), // index 6
      parseInt(AutonomousValues.algaeRemoved.text), // index 7
      parseInt(AutonomousValues.algaeProcessor.text), // index 8
      parseInt(AutonomousValues.algaeBarge.text), // index 9

      // L1 Coral Values
      parseInt(AutonomousValues.l1NW.text), // index 10
      parseInt(AutonomousValues.l1NE.text), // index 11
      parseInt(AutonomousValues.l1W.text), // index 12
      parseInt(AutonomousValues.l1E.text), // index 13
      parseInt(AutonomousValues.l1SW.text), // index 14
      parseInt(AutonomousValues.l1SE.text), // index 15

      // L2 Coral Values
      parseInt(AutonomousValues.l2A.text), // index 16
      parseInt(AutonomousValues.l2B.text), // index 17
      parseInt(AutonomousValues.l2C.text), // index 18
      parseInt(AutonomousValues.l2D.text), // index 19
      parseInt(AutonomousValues.l2E.text), // index 20
      parseInt(AutonomousValues.l2F.text), // index 21
      parseInt(AutonomousValues.l2G.text), // index 22
      parseInt(AutonomousValues.l2H.text), // index 23
      parseInt(AutonomousValues.l2I.text), // index 24
      parseInt(AutonomousValues.l2J.text), // index 25
      parseInt(AutonomousValues.l2K.text), // index 26
      parseInt(AutonomousValues.l2L.text), // index 27

      // L3 Coral Values
      parseInt(AutonomousValues.l3A.text), // index 28
      parseInt(AutonomousValues.l3B.text), // index 29
      parseInt(AutonomousValues.l3C.text), // index 30
      parseInt(AutonomousValues.l3D.text), // index 31
      parseInt(AutonomousValues.l3E.text), // index 32
      parseInt(AutonomousValues.l3F.text), // index 33
      parseInt(AutonomousValues.l3G.text), // index 34
      parseInt(AutonomousValues.l3H.text), // index 35
      parseInt(AutonomousValues.l3I.text), // index 36
      parseInt(AutonomousValues.l3J.text), // index 37
      parseInt(AutonomousValues.l3K.text), // index 38
      parseInt(AutonomousValues.l3L.text), // index 39

      // L4 Coral Values
      parseInt(AutonomousValues.l4A.text), // index 40
      parseInt(AutonomousValues.l4B.text), // index 41
      parseInt(AutonomousValues.l4C.text), // index 42
      parseInt(AutonomousValues.l4D.text), // index 43
      parseInt(AutonomousValues.l4E.text), // index 44
      parseInt(AutonomousValues.l4F.text), // index 45
      parseInt(AutonomousValues.l4G.text), // index 46
      parseInt(AutonomousValues.l4H.text), // index 47
      parseInt(AutonomousValues.l4I.text), // index 48
      parseInt(AutonomousValues.l4J.text), // index 49
      parseInt(AutonomousValues.l4K.text), // index 50
      parseInt(AutonomousValues.l4L.text), // index 51
    ]);
  }

  /// Computes all teleoperated values and returns them as a single string separated by a caret
  static String computeTeleopValues() {
    return computeValues([
      parseInt(TeleoperatedValues.coralL1.text), // index 52
      parseInt(TeleoperatedValues.coralL2.text), // index 53
      parseInt(TeleoperatedValues.coralL3.text), // index 54
      parseInt(TeleoperatedValues.coralL4.text), // index 55
      parseInt(TeleoperatedValues.coralMissed.text), // index: 56
      parseInt(TeleoperatedValues.algaeRemoved.text), // index: 57
      parseInt(TeleoperatedValues.algaeProcessor.text), // index: 58
      parseInt(TeleoperatedValues.algaeBarge.text), // index: 59
      parseInt(TeleoperatedValues.defenseTime.text) // index: 60
    ]);
  }

  /// Computes all endgame values and returns them as a single string separated by a caret
  static String computeEndgameValues() {
    return computeValues([
      parseString(EndgameValues.endgame.text), // index: 61
      parseString(EndgameValues.climbTime.text), // index: 62
    ]);
  }

  /// Computes all comment values and returns them as a single string separated by a caret
  static String computeCommentValues() {
    return computeValues([
      parseString(stripEmoji(CommentValues.autoComments.text)), // index: 63
      parseString(stripEmoji(CommentValues.teleopComments.text)), // index: 64
      parseString(stripEmoji(CommentValues.endgameComments.text)) // index: 65
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
