// ignore_for_file: file_names
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants..dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class AppDataHelper {
  // Save the current event ID to a file called "current_event_id.txt"
  static Future<void> saveCurrentEventIDAndCurrentDriverStation() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file = File(AppConstants.appDataFilePath);
      await file.writeAsString(
          "${SettingValues.eventID.text},${SettingValues.selectedDriverStation}");
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
}
