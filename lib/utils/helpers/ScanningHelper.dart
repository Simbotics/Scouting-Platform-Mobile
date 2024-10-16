import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants.dart';
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

  static generateCsv(List<String> values) async {
    // Request storage permission
    await Permission.storage.request();

    if (await Permission.storage.isGranted) {
      // ignore: avoid_print
      if (AppConstants.isDebug) print('Storage permission granted');
    } else {
      // ignore: avoid_print
      if (AppConstants.isDebug) print('Storage permission denied');
    }

    // File name for generated CSV file
    String fileName = SettingValues.getCurrentSavingSpreadsheetName();

    Directory? directory;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      directory = await getDownloadsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
    }

    final file = File('${directory?.path}/$fileName');

    bool fileExists = await file.exists();


    List<List<String>> data = [];

    if (!fileExists) {
      await file.writeAsString('sep=^\n', mode: FileMode.append);
      data.add(csvColumnNames);
    } else {
      await file.writeAsString('\n', mode: FileMode.append);
    }

    data.add(values);

    String csv = const ListToCsvConverter(fieldDelimiter: "^").convert(data);

    await file.writeAsString(csv, mode: FileMode.append, flush: true);
  }
}
