// ignore_for_file: file_names
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE

class SchedulingData {
  // Current scouting driver station
  static String currentScoutingDriverStation = "Red 1";
  static late int argumentReadingIndex;

  // Create a texteditingcontroller which holds the ID of the current fetching event
  static final TextEditingController eventIDController =
      TextEditingController(text: "");

  // Create a list of all the driver stations for the dropdown menu
  static List<String> driverStations = [
    "Red 1",
    "Red 2",
    "Red 3",
    "Blue 1",
    "Blue 2",
    "Blue 3",
  ];

  static Future<String> get _scheduleDirecotyPath async {
    final directory = Directory('/storage/emulated/0/Documents');

    return directory.path;
  }

  static Future<File> get _scheduleFile async {
    final path = await _scheduleDirecotyPath;
    return File('$path/match_schedule_${eventIDController.text}.csv');
  }

  // Fetched the current schedule file from the repository
  static Future<void> fetchEventSchedule() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final response = await http.get(Uri.parse(
          "https://raw.githubusercontent.com/Simbotics/Scouting-Archive/main/2023/schedules/match_schedule_" +
              eventIDController.text +
              ".csv"));
      final bytes = response.bodyBytes;
      final file = await _scheduleFile;
      await file.writeAsBytes(bytes);
    } else {
      throw Exception('Permission denied');
    }
  }

  // Save the current event ID to a file called "current_event_id.txt"
  static Future<void> saveCurrentEventIDAndCurrentDriverStation() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file = File("/storage/emulated/0/Documents/current_event_id.txt");
      await file.writeAsString(
          eventIDController.text + "," + currentScoutingDriverStation);
    } else {
      throw Exception('Permission denied');
    }
  }

  // Get the current event ID from a file called "current_event_id.txt"
  static Future<String> getCurrentEventIDAndCurrentDriverStation() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file = File("/storage/emulated/0/Documents/current_event_id.txt");
      if (await file.exists()) {
        return await file.readAsString();
      } else {
        return "";
      }
    } else {
      throw Exception('Permission denied');
    }
  }

// Read a line from the schedule file
  static Future<String?> readLineFromSchedule(int lineNumber) async {
    final file = File("/storage/emulated/0/Documents/match_schedule_" +
        eventIDController.text +
        ".csv");

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
    switch (currentScoutingDriverStation) {
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
