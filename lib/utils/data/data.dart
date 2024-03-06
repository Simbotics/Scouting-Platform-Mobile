// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE
class Data {
  static late int argumentReadingIndex;
  static late int driverStationIdentifier;

  static final yesNoOptions = ["Yes", "No"];
  static final climbOptions = ["No", "Single", "Double", "Triple", "Park"];
  // Create files like these to store certain variables such as team numbers, match numbers, etc.
  // This is just a placeholder file and is to be deleted as this is just an example.
  //auto
  static TextEditingController autoMobility = TextEditingController(text:"No");
  static TextEditingController autoSpeakerScored = TextEditingController(text: "0");
  static TextEditingController autoSpeakerMissed = TextEditingController(text: "0");
  static TextEditingController autoAmpScored = TextEditingController(text: "0");
  static TextEditingController autoAmpMissed = TextEditingController(text: "0");
  static final TextEditingController stopwatchState = TextEditingController(text: "0");
  static final stopwatch = Stopwatch();

  //teleop
  static TextEditingController speaker = TextEditingController(text: "0");
  static TextEditingController speakerMissed = TextEditingController(text: "0");
  static TextEditingController amp = TextEditingController(text: "0");
  static TextEditingController ampMissed = TextEditingController(text: "0");
  static TextEditingController climb = TextEditingController(text: "No");
  static TextEditingController climbTime = TextEditingController(text: "0");
  static TextEditingController trap = TextEditingController(text: "0");
  static TextEditingController parked = TextEditingController(text: "No");
  static TextEditingController harmony = TextEditingController(text: "No");

  //comments
  static final TextEditingController autoComments = TextEditingController(text: "");
  static final TextEditingController autoOrder = TextEditingController(text:"");
  static final TextEditingController teleopComments = TextEditingController(text: "");
  static final TextEditingController endgameComments = TextEditingController(text: "");

  //team and match info
  static String driverStation = "Red 1";
  
  static final TextEditingController teamNumber = TextEditingController(text: "");
  static final TextEditingController matchNumber = TextEditingController(text: "");
  static final TextEditingController initials = TextEditingController(text: "");

    static Future<String> get _scheduleDirecotyPath async {
    final directory = Directory('/storage/emulated/0/Documents');

    return directory.path;
  }

  static Future<File> get _scheduleFile async {
    final path = await _scheduleDirecotyPath;
    return File('$path/match_schedule_${eventID.text}.csv');
  }
  
  static get http => null;

  // Fetched the current schedule file from the repository
  static Future<void> fetchEventSchedule() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final response = await http.get(Uri.parse(
          "https://raw.githubusercontent.com/Simbotics/Scouting-Archive/main/2023/schedules/match_schedule_" +
              eventID.text +
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
      final file =
          File("/storage/emulated/0/Documents/scouting_app_data.pickle");
      await file.writeAsString(
          eventID.text + "," + driverStation);
    } else {
      throw Exception('Permission denied');
    }
  }

  // Get the current event ID from a file called "current_event_id.txt"
  static Future<String> getCurrentEventIDAndCurrentDriverStation() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file =
          File("/storage/emulated/0/Documents/scouting_app_data.pickle");
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
        eventID.text +
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
    switch (selectedDriverStation.text) {
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

    // Is team number editable (yes or no)
  static String isTeamNumberEditable = "No";
  static bool isTeamNumberReadOnly = true;

  // scanning data
    // scanning
  static List<String> unscannedDevices = ['0', '1', '2', '3', '4', '5'];
  static List<String> scannedDevices = [];

  static String currentSavingSpreadsheetName = "2024-Newmarket.csv";

  static final TextEditingController currentSavingSpreadsheetNameController =
      TextEditingController(text: "2024-Newmarket");

    // Create a list of all the driver stations for the dropdown menu
  static List<String> driverStations = [
    "Red 1",
    "Red 2",
    "Red 3",
    "Blue 1",
    "Blue 2",
    "Blue 3",
  ];


  static TextEditingController selectedDriverStation = TextEditingController(text: "Red 1");
  static TextEditingController eventID = TextEditingController(text: "");
  static TextEditingController fileName = TextEditingController(text: "");
   static TextEditingController selectedCenterfold = TextEditingController(text: "cheese");
  static List<String> images = [
    "cheese"
  ];
}
