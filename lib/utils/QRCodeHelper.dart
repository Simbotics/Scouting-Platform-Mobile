// ignore_for_file: file_names
import 'dart:convert';

import 'package:scouting_platform/utils/data/constants/AppConstants..dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/utils/data/values/CommentValues.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class QrcodeHelper {
  /// Returns a string that represents the contents of the QR code that will be generated and separates them with a "^" character
  static String getQRCodeString() {
    var computedValues = computeValues([
      computePrematchValues(),
      computeAutonomousValues(),
      computeTeleopValues(),
      computeEndgameValues(),
      computeCommentValues(),
      computeSuffixValues()
    ]);

    if (AppConstants.isDebug) print(computedValues);

    // Encode to UTF-8 and then base64 to compress size and reduce issues with characters
    List<int> utf8Encoded = utf8.encode(computedValues);

    return base64.encode(utf8Encoded);
  }

  static String computePrematchValues() {
    return computeValues([
      parseInt(PrematchValues.teamNumber.text),
      parseInt(PrematchValues.matchNumber.text),
      parseString(PrematchValues.initials.text),
      parseString(SettingValues.selectedDriverStation.text)
    ]);
  }

  static String computeAutonomousValues() {
    return computeValues([
      parseInt(AutonomousValues.autoSpeakerScored.text),
      parseInt(AutonomousValues.autoSpeakerMissed.text),
      parseInt(AutonomousValues.autoAmpScored.text),
      parseInt(AutonomousValues.autoAmpMissed.text),
      parseString(AutonomousValues.autoMobility.text)
    ]);
  }

  static String computeTeleopValues() {
    return computeValues([
      parseInt(TeleoperatedValues.speaker.text),
      parseInt(TeleoperatedValues.speakerMissed.text),
      parseInt(TeleoperatedValues.amp.text),
      parseInt(TeleoperatedValues.ampMissed.text),
      parseInt(TeleoperatedValues.passes.text)
    ]);
  }

  static String computeEndgameValues() {
    return computeValues([
      parseString(EndgameValues.endgame.text),
      parseString(EndgameValues.climbTime.text),
      parseInt(EndgameValues.trap.text)
    ]);
  }

  static String computeCommentValues() {
    return computeValues([
      parseString(CommentValues.autoComments.text),
      parseString(CommentValues.autoOrder.text),
      parseString(CommentValues.teleopComments.text),
      parseString(CommentValues.endgameComments.text)
    ]);
  }

  static String computeSuffixValues() {
    return computeValues([
      parseString(OptionConstants.availableDriverstations
          .indexOf(SettingValues.selectedDriverStation.text)
          .toString())
    ]);
  }

  static String computeValues(List<String> values) {
    return values.join("^");
  }

  static String parseString(String value) {
    return value.replaceAll("\n", "");
  }

  static String parseInt(String value) {
    return (int.tryParse(value) ?? 0).toString();
  }
}
