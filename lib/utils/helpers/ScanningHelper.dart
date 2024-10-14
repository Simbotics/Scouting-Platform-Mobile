// ignore_for_file: file_names

import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants..dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class ScanningHelper {
  static List<String> unscannedDevices = ['0', '1', '2', '3', '4', '5'];
  static List<String> scannedDevices = [];

  /// CONFIGURE CSV COLUMN NAMES HERE
  /// Be sure that all indexes in this array line up with the indexes provided in QRCodeHelper.dart
  static final List<String> csvColumnNames = [
    "Team #",
    "Match #",
    "Initials",
    "Alliance Colour",
    "Auto Speaker Scored",
    "Auto Speaker Missed",
    "Auto Amp Scored",
    "Auto Amp Missed",
    "Auto Mobility",
    "Teleop Speaker Scored",
    "Teleop Speaker Missed",
    "Teleop Amp Scored",
    "Teleop Amp Missed",
    "Teleop Passes",
    "Teleop Endgame",
    "Teleop Climb Time",
    "Teleop Trap",
    "Auto Comments",
    "Auto Order",
    "Teleop Comments",
    "Endgame Comments"
  ];

  static generateCsv(
      // Scout/match data
      List<String> values) async {
    // Request storage permission
    await Permission.storage.request();

    if (await Permission.storage.isGranted) {
      // ignore: avoid_print
      if (AppConstants.isDebug) print('Storage permission granted');
    } else {
      // ignore: avoid_print
      if (AppConstants.isDebug) print('Storage permission denied');
    }

    // File name for generated csv file
    String fileName = SettingValues.getCurrentSavingSpreadsheetName();

    Directory? directory;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      directory = await getDownloadsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
    }

    final file = File('${directory?.path}/$fileName');

    // Check if the file already exists
    bool fileExists = await file.exists();

    // Add column names to data if the file doesn't exist
    List<List<String>> data = [];

    if (!fileExists) {
      await writeToFile(fileName,
          'sep=^\n'); // Used to automatically determine the delimiter when opening the file in excel
      data.add(csvColumnNames);
    }

    data.add(values);

    if (fileExists) {
      await writeToFile(fileName, "\n");
    }

    // Convert data to csv data and add "^" as field delimiter
    String csv = const ListToCsvConverter(fieldDelimiter: "^").convert(data);

    // Write QR code data/excel data to file
    await writeToFile(fileName, csv);
  }

  // Creates file in the app directory.
  static Future<File> createFileInAppDirectory(String fileName) async {
    Directory? directory;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      directory = await getDownloadsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
    }
    final file = File('${directory?.path}/$fileName');
    await file.create();
    return file;
  }

  // Creates and writes a string to a file in the app directory.
  static Future<File> writeToFile(String fileName, String fileContents) async {
    final file = await createFileInAppDirectory(fileName);
    return file.writeAsString(fileContents,
        flush: true,
        mode: FileMode.append); // write to file if exists, else create file
  }
}
