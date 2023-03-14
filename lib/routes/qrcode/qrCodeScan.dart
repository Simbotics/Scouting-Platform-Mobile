// ignore_for_file: file_names
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scouting_platform/main.dart';
import 'package:scouting_platform/routes/qrcode/qrCodeScannedData.dart';
import 'package:scouting_platform/ui/style/style.dart';

class ScanQRCode extends StatelessWidget {
  const ScanQRCode({Key? key, required this.title}) : super(key: key);
  final String title;

  static late List<String>? barcodeStrings;
  static late List<Barcode> barcodes;
  static late String fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: AppStyle.textInputColor,
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Futura'),
            ),
          )),
      body: MobileScanner(
        fit: BoxFit.contain,
        onDetect: (capture) {
          barcodes = capture.barcodes; // Barcode(s) scanned
          //final Uint8List? image = capture.image; // Image of QR code
          for (final barcode in barcodes) {
            barcodeStrings = barcode.rawValue?.split(",");
            fileName = "M${barcodeStrings![1]}-${barcodeStrings![0]}.csv"
                .replaceAll(" ", "");

            //barcodeStrings![19]);
            debugPrint(
                'Barcode found! ${barcode.rawValue}'); // Prints value scanned
            HomeScreen.cameraController.stop().then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      // Go to csv file options route
                      ScannedQRCodeData(
                    title: 'Scanned QR Code Data',
                    teamNumber: barcodeStrings![0],
                    matchNumber: barcodeStrings![1],
                    initials: barcodeStrings![2],
                    autoLow: barcodeStrings![3],
                    autoMid: barcodeStrings![4],
                    autoHigh: barcodeStrings![5],
                    autoMissed: barcodeStrings![6],
                    autoDropped: barcodeStrings![7],
                    balancedInAuto: barcodeStrings![8],
                    balancedAutoTime: barcodeStrings![9],
                    teleopConeLow: barcodeStrings![10],
                    teleopConeMid: barcodeStrings![11],
                    teleopConeHigh: barcodeStrings![12],
                    teleopConeMissed: barcodeStrings![13],
                    teleopCubeLow: barcodeStrings![14],
                    teleopCubeMid: barcodeStrings![15],
                    teleopCubeHigh: barcodeStrings![16],
                    teleopCubeMissed: barcodeStrings![17],
                    balancedInTeleop: barcodeStrings![18],
                    balancedTeleopTime: barcodeStrings![19],
                    autoComments: barcodeStrings![20],
                    preferenceComments: barcodeStrings![21],
                    otherComments: barcodeStrings![22],
                    fileName: fileName,
                  ),
                ))); // Turn off camera
          }
        },
      ),
    );
  }

  static generateCsv(
      // Scout/match data
      String teamNumber,
      String matchNumber,
      String initials,
      // Auto scoring levels
      String autoScoredLow,
      String autoScoredMid,
      String autoScoredHigh,
      String autoScoredMissed,
      String autoDropped,
      // Auto balancing
      String balancedInAuto,
      String balancedAutoTime,
      // Teleop scoring levels
      String teleopScoredConeLow,
      String teleopScoredConeMid,
      String teleopScoredConeHigh,
      String teleopScoredConeMissed,
      String teleopScoredCubeLow,
      String teleopScoredCubeMid,
      String teleopScoredCubeHigh,
      String teleopScoredCubeMissed,
      String balancedInTeleop,
      String balancedTeleopTime,
      String autoComments,
      String preferenceComments,
      String otherComments) async {
    List<List<String>> data = [
      [
        "Team #",
        "Match #",
        "Initials",
        "Auto Low",
        "Auto Mid",
        "Auto High",
        "Auto Missed",
        "Auto Dropped",
        "Balanced In Auto?",
        "Balance Auto Time",
        "Teleop Cone Low",
        "Teleop Cone Mid",
        "Teleop Cone High",
        "Teleop Cone Missed",
        "Teleop Cube Low",
        "Teleop Cube Mid",
        "Teleop Cube High",
        "Teleop Cube Missed",
        "Balanced in teleop?",
        "Balance Teleop Time",
        "Auto Comments",
        "Preference Comments",
        "Other Comments"
      ],
      [
        // Team and match information
        teamNumber,
        matchNumber,
        initials,

        // Auto scored levels
        autoScoredLow,
        autoScoredMid,
        autoScoredHigh,
        autoScoredMissed,
        autoDropped,

        // Auto balance stats
        balancedInAuto,
        balancedAutoTime,

        // Teleop cone scored levels
        teleopScoredConeLow,
        teleopScoredConeMid,
        teleopScoredConeHigh,
        teleopScoredConeMissed,

        // Teleop cube scored levels
        teleopScoredCubeLow,
        teleopScoredCubeMid,
        teleopScoredCubeHigh,
        teleopScoredCubeMissed,

        // Teleop balance stats
        balancedInTeleop,
        balancedTeleopTime,

        // Comments
        autoComments,
        preferenceComments,
        otherComments
      ],
    ];

    String csv = const ListToCsvConverter().convert(data);

    // Folder to create CSV files in.

    // File name for generated csv file
    fileName = "M$matchNumber-$teamNumber.csv".replaceAll(" ", "");

    // Write to file
    await writeToFile(fileName, csv);
    //debugPrint("Creating and writing CSV file!");
  }

  static Future<File> createFileInAppDirectory(String fileName) async {
    final directory = (await getExternalStorageDirectories())?.first;
    final file = File('${directory?.path}/$fileName');
    await file.create();
    return file;
  }

  static Future<File> writeToFile(String fileName, String fileContents) async {
    final file = await createFileInAppDirectory(fileName);
    if (kDebugMode) {
      print("Writing to file...");
    }
    return file.writeAsString(fileContents);
  }
}
