// ignore_for_file: file_names
import 'package:flutter/material.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE
class Data {
  static final yesNoOptions = ["yes", "no"];
  // Create files like these to store certain variables such as team numbers, match numbers, etc.
  // This is just a placeholder file and is to be deleted as this is just an example.
  //auto
  static TextEditingController autoMobility = TextEditingController(text:"no");
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
  static TextEditingController climb = TextEditingController(text: "no");
  static TextEditingController climbTime = TextEditingController(text: "0");
  static TextEditingController trap = TextEditingController(text: "0");
  static TextEditingController spotlight = TextEditingController(text: "no");

  //comments
  static final TextEditingController autoComments = TextEditingController(text: "");
  static final TextEditingController teleopComments = TextEditingController(text: "");
  static final TextEditingController endgameComments = TextEditingController(text: "");

  //team and match info
  static String driverStation = "Red 1";
  
  static final TextEditingController teamNumber = TextEditingController(text: "");
  static final TextEditingController matchNumber = TextEditingController(text: "");
  static final TextEditingController initials = TextEditingController(text: "");

  // scanning data
    // scanning
  static List<String> unscannedDevices = ['0', '1', '2', '3', '4', '5'];
  static List<String> scannedDevices = [];

  static String currentSavingSpreadsheetName = "2024-Houston-Worlds.csv";

  static final TextEditingController currentSavingSpreadsheetNameController =
      TextEditingController(text: "2024-Houston-Worlds");

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
