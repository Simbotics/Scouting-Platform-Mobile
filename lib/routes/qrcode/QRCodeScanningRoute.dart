// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/qrcode/ScannedDataPreviewRoute.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class QRCodeScanningRoute extends StatelessWidget {
  const QRCodeScanningRoute({Key? key, required this.title}) : super(key: key);
  final String title;

  // The scanned QR code data split into an array
  static late List<String>? barcodeStrings;
  // Array of barcodes scannned
  static late List<Barcode> barcodes;
  // Name of file generated when scanned
  static late String fileName;

  static MobileScannerController cameraController =
      MobileScannerController(); // Camera controller for scanning QR codes

  @override
  Widget build(BuildContext context) {
    cameraController.start(); // Start camera
    return PlatformRoute(
      title: title,
      body: RotatedBox(
          quarterTurns: -1, // Fix rotation being messed up
          child: MobileScanner(
              fit: BoxFit.contain,
              onDetect: (capture) {
                QRCodeScanningRoute.barcodes =
                    capture.barcodes; // Barcode(s) scanned
                // ignore: unused_local_variable
                for (final barcode in QRCodeScanningRoute.barcodes) {
                  barcodes = capture.barcodes; // Barcode(s) scanned
                  for (final barcode in barcodes) {
                    List<int> decodedBytes = base64.decode(barcode.rawValue);
                    String decodedBarcodeString = utf8.decode(decodedBytes);
                    barcodeStrings = decodedBarcodeString.split("^");
                    fileName = SettingValues.getCurrentSavingSpreadsheetName();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScannedDataPreviewRoute(
                                title: 'Scanned QR Code Data',
                                teamNumber: barcodeStrings![0],
                                matchNumber: barcodeStrings![1],
                                initials: barcodeStrings![2],
                                allianceColour: barcodeStrings![3],
                                autoSpeakerScored: barcodeStrings![4],
                                autoSpeakerMissed: barcodeStrings![5],
                                autoAmpScored: barcodeStrings![6],
                                autoAmpMissed: barcodeStrings![7],
                                autoMobility: barcodeStrings![8],
                                teleopSpeakerScored: barcodeStrings![9],
                                teleopSpeakerMissed: barcodeStrings![10],
                                teleopAmpScored: barcodeStrings![11],
                                teleopAmpMissed: barcodeStrings![12],
                                teleopPasses: barcodeStrings![13],
                                teleopEndgame: barcodeStrings![14],
                                teleopClimbTime: barcodeStrings![15],
                                teleopTrap: barcodeStrings![16],
                                autoComments: barcodeStrings![17],
                                autoOrder: barcodeStrings![18],
                                teleopComments: barcodeStrings![19],
                                endgameComments: barcodeStrings![20])));

                    cameraController.stop();
                  }
                }
              })),
    );
  }

  static generateCsv(
      // Scout/match data
      String teamNumber,
      String matchNumber,
      String initials,
      String allianceColour,
      // Auto speaker and amp scoring
      String autoSpeakerScored,
      String autoSpeakerMissed,
      String autoAmpScored,
      String autoAmpMissed,
      // Auto mobility
      String autoMobility,
      // Teleop scorin
      String teleopSpeakerScored,
      String teleopSpeakerMissed,
      String teleopAmpScored,
      String teleopAmpMissed,
      String teleopPasses,
      String teleopEndgame,
      String teleopClimbTime,
      String teleopTrap,
      // Comments
      String autoComments,
      String autoOrder,
      String teleopComments,
      String endgameComments) async {
    // Request storage permission
    await Permission.storage.request();

    if (await Permission.storage.isGranted) {
      print('Storage permission granted');
    } else {
      print('Storage permission denied');
    }

    // File name for generated csv file
    String fileName = SettingValues.getCurrentSavingSpreadsheetName();

    final directory = await getExternalStorageDirectory();
    // final directory = Directory("/storage/emulated/0/Documents");
    //final directory = Directory(getApplicationDocumentsDirectory().toString());
    final file = File('${directory?.path}/$fileName');

    // Check if the file already exists
    bool fileExists = await file.exists();

    // Column names
    List<String> columns = [
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

    // Add column names to data if the file doesn't exist
    List<List<String>> data = [];
    if (!fileExists) {
      await writeToFile(fileName,
          'sep=^\n'); // Used to automatically determine the delimiter when opening the file in excel
      data.add(columns);
    }

    // Add data to list
    List<String> rowData = [
      teamNumber,
      matchNumber,
      initials,
      allianceColour,
      autoSpeakerScored,
      autoSpeakerMissed,
      autoAmpScored,
      autoAmpMissed,
      autoMobility,
      teleopSpeakerScored,
      teleopSpeakerMissed,
      teleopAmpScored,
      teleopAmpMissed,
      teleopPasses,
      teleopEndgame,
      teleopClimbTime,
      teleopTrap,
      autoComments,
      autoOrder,
      teleopComments,
      endgameComments
    ];
    data.add(rowData);

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
    final directory = await getExternalStorageDirectory();
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
