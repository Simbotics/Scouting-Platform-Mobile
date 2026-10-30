// ignore_for_file: file_names
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/utils/data/values/CommentValues.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';

class AppDataHelper {
  // Save the current event ID to a file called "current_event_id.txt"
  static Future<void> saveCurrentEventIDAndCurrentDriverStation() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file = File(AppConstants.appDataFilePath);
      await file.writeAsString(
          "${SettingValues.eventID.text},${SettingValues.selectedDriverStation.text}");
    } else {
      throw Exception('Permission denied');
    }
  }

  static Future<void> saveQRCodeCopy(String data) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file = File(
          "/storage/emulated/0/Documents/${SettingValues.eventID.text}_output.csv");
      if (!await file.exists()) {
        await file.create();
      }

      //Check if the latest record is duplicated
      final lines = await file.readAsLines();
      final records = lines.where((lines) => lines.isNotEmpty);
      if (records.isNotEmpty) {
        if (scoutingDataOnly(records.last) == scoutingDataOnly(data)) {
          return;
        }
      }

      await file.writeAsString("$data\n", mode: FileMode.append);
    } else {
      throw Exception('Permission denied');
    }
  }

  // Get the current event ID from a file called "current_event_id.txt"
  static Future<String> getCurrentEventIDAndCurrentDriverStation() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file = File(AppConstants.appDataFilePath);
      if (await file.exists()) {
        return await file.readAsString();
      } else {
        return "";
      }
    } else {
      throw Exception('Permission denied');
    }
  }

// Remove battery level from data
  static String scoutingDataOnly(String data) {
    return data.split('^').skip(1).join('^');
  }

  static void resetStates() {
    PrematchValues.hopperCapacity.clear();
    PrematchValues.teamNumber.clear();

    AutonomousValues.resetAutoEtcValues();
    TeleoperatedValues.resetTeleopValues();
    EndgameValues.resetEndgameValues();
    CommentValues.resetComments();
  }
}
