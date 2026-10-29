// ignore_for_file: file_names

import 'dart:io';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class Schedulehelper {
  static late int argumentReadingIndex;

  // Read a line from the schedule file
  static Future<String?> readLineFromSchedule(int lineNumber) async {
    final file = File(
        "/storage/emulated/0/Documents/match_schedule_${SettingValues.eventID.text}.csv");

    if (await file.exists()) {
      final lines = await file.readAsLines();
      if (lineNumber > 0 && lineNumber < lines.length) {
        return lines[lineNumber];
      } else {
        return null;
      }
    }
    return null;
  }

  static Future<int?> getTeamNumberFromSchedule(int matchNumber) async {
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
      return null;
    }
  }

  static Future<String> findRobotCapacity(String teamNumber) async {
    final file = File("/storage/emulated/0/Documents/robot_capacity.csv");
    if (await file.exists()) {
      final lines = await file.readAsLines();
      for (String line in lines) {
        final columns = line.split(',');
        if (columns[0] == teamNumber) {
          return columns[1];
        }
      }
    }
    return "";
  }
}
