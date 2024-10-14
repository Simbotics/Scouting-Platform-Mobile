// ignore_for_file: file_names

import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class Schedulehelper {
  static late int argumentReadingIndex;
  static late int driverStationIdentifier;

  static Future<String> get _scheduleDirecotyPath async {
    final directory = Directory('/storage/emulated/0/Documents');

    return directory.path;
  }

  static Future<File> get _scheduleFile async {
    final path = await _scheduleDirecotyPath;
    return File('$path/match_schedule_${SettingValues.eventID.text}.csv');
  }

  static get http => null;

  // Fetched the current schedule file from the repository
  static Future<void> fetchEventSchedule() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final response = await http.get(Uri.parse(
          "${AppConstants.githubSchedulesCDN}/match_schedule_${SettingValues.eventID.text}.csv"));
      final bytes = response.bodyBytes;
      final file = await _scheduleFile;
      await file.writeAsBytes(bytes);
    } else {
      throw Exception('Permission denied');
    }
  }

  // Read a line from the schedule file
  static Future<String?> readLineFromSchedule(int lineNumber) async {
    final file = File(
        "/storage/emulated/0/Documents/match_schedule_${SettingValues.eventID.text}.csv");

    if (await file.exists()) {
      final lines = await file.readAsLines();
      if (lines.length >= lineNumber) {
        return lines[lineNumber];
      } else {
        return null;
      }
    }
    return null;
  }

  static Future<int> getTeamNumberFromSchedule(int matchNumber) async {
    switch (SettingValues.selectedDriverStation.text) {
      case "Red 1":
        argumentReadingIndex = 1;
        break;
      case "Red 2":
        argumentReadingIndex = 2;
        break;
      case "Red 3":
        argumentReadingIndex = 3;
        break;
      case "Blue 1":
        argumentReadingIndex = 4;
        break;
      case "Blue 2":
        argumentReadingIndex = 5;
        break;
      case "Blue 3":
        argumentReadingIndex = 6;
        break;
    }
    String? lineStringValues = await readLineFromSchedule(matchNumber);

    if (lineStringValues != null) {
      List<String> arguments = lineStringValues.split(",");
      return int.parse(arguments[argumentReadingIndex]);
    } else {
      return 0;
    }
  }
}
