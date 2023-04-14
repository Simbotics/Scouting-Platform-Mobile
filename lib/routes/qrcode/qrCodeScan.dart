// ignore_for_file: file_names
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scouting_platform/main.dart';
import 'package:scouting_platform/routes/qrcode/qrCodeScannedData.dart';
import 'package:scouting_platform/ui/style/style.dart';

class ScanQRCode extends StatelessWidget {
  const ScanQRCode({Key? key, required this.title}) : super(key: key);
  final String title;

  // The scanned QR code data split into an array
  static late List<String>? barcodeStrings;
  // Array of barcodes scannned
  static late List<Barcode> barcodes;
  // Name of file generated when scanned
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
            ScanQRCode.barcodes = capture.barcodes; // Barcode(s) scanned
            //final Uint8List? image = capture.image; // Image of QR code
            // ignore: unused_local_variable
            for (final barcode in ScanQRCode.barcodes) {
              barcodes = capture.barcodes; // Barcode(s) scanned
              //final Uint8List? image = capture.image; // Image of QR code
              for (final barcode in barcodes) {
                List<int> decodedBytes = base64.decode(barcode.rawValue);
                String decodedBarcodeString = utf8.decode(decodedBytes);
                barcodeStrings = decodedBarcodeString.split("~");
                fileName = "2023-Houston-Worlds.csv";

                // Stop the camera scanning then send the user to the "View Data" page.
                HomeScreen.cameraController
                    .stop()
                    .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              // Go to csv file options route
                              ScannedQRCodeData(
                            title: 'Scanned QR Code Data',
                            teamNumber: ScanQRCode.barcodeStrings![0],
                            matchNumber: ScanQRCode.barcodeStrings![1],
                            initials: ScanQRCode.barcodeStrings![2],
                            allianceColour: ScanQRCode.barcodeStrings![3],
                            autoLow: ScanQRCode.barcodeStrings![4],
                            autoMid: ScanQRCode.barcodeStrings![5],
                            autoHigh: ScanQRCode.barcodeStrings![6],
                            autoMissed: ScanQRCode.barcodeStrings![7],
                            autoMobility: ScanQRCode.barcodeStrings![8],
                            autoBalance: ScanQRCode.barcodeStrings![9],
                            autoBalanceTime: ScanQRCode.barcodeStrings![10],
                            teleopConeLow: ScanQRCode.barcodeStrings![11],
                            teleopConeMid: ScanQRCode.barcodeStrings![12],
                            teleopConeHigh: ScanQRCode.barcodeStrings![13],
                            teleopConeMissed: ScanQRCode.barcodeStrings![14],
                            teleopConeDropped: ScanQRCode.barcodeStrings![15],
                            teleopCubeLow: ScanQRCode.barcodeStrings![16],
                            teleopCubeMid: ScanQRCode.barcodeStrings![17],
                            teleopCubeHigh: ScanQRCode.barcodeStrings![18],
                            teleopCubeMissed: ScanQRCode.barcodeStrings![19],
                            teleopCubeDropped: ScanQRCode.barcodeStrings![20],
                            teleopBalance: ScanQRCode.barcodeStrings![21],
                            teleopBalanceTime: ScanQRCode.barcodeStrings![22],
                            autoComments: ScanQRCode.barcodeStrings![23],
                            preferenceComments: ScanQRCode.barcodeStrings![24],
                            otherComments: ScanQRCode.barcodeStrings![25],
                            driverStationIdentifier:
                                ScanQRCode.barcodeStrings![26],
                            fileName: ScanQRCode.fileName,
                          ),
                        )));
              }
            }
          }),
    );
  }

  /// Generates a CSV file in the app directory with the scanned data
  static generateCsv(
      // Scout/match data
      String teamNumber,
      String matchNumber,
      String initials,
      String allianceColour,
      // Auto scoring levels
      String autoScoredLow,
      String autoScoredMid,
      String autoScoredHigh,
      String autoScoredMissed,
      // Auto balancing and mobility
      String autoMobility,
      String autoBalance,
      String autoBalanceTime,
      // Teleop scoring levels
      String teleopScoredConeLow,
      String teleopScoredConeMid,
      String teleopScoredConeHigh,
      String teleopConeMissed,
      String teleopConeDropped,
      String teleopScoredCubeLow,
      String teleopScoredCubeMid,
      String teleopScoredCubeHigh,
      String teleopCubeMissed,
      String teleopCubeDropped,
      // Teleop balance
      String teleopBalance,
      String teleopBalanceTime,
      // Comments
      String autoComments,
      String preferenceComments,
      String otherComments) async {
    // File name for generated csv file
    String fileName = "2023-Houston-Worlds.csv";

    final directory = Directory("/storage/emulated/0/Documents");
    final file = File('${directory.path}/$fileName');

    // Check if the file already exists
    bool fileExists = await file.exists();

    // Column names
    List<String> columns = [
      "Team #",
      "Match #",
      "Initials",
      "Alliance Colour",
      "Auto Low",
      "Auto Mid",
      "Auto High",
      "Auto Missed",
      "Auto Mobility",
      "Auto Balance",
      "Auto Balance Time",
      "Teleop Cone Low",
      "Teleop Cone Mid",
      "Teleop Cone High",
      "Teleop Cone Dropped",
      "Teleop Cone Missed",
      "Teleop Cube Low",
      "Teleop Cube Mid",
      "Teleop Cube High",
      "Teleop Cube Dropped",
      "Teleop Cube Missed",
      "Teleop Balance",
      "Teleop Balance Time",
      "Auto Comments",
      "Preference Comments",
      "Other Comments"
    ];

    // Add column names to data if the file doesn't exist
    List<List<String>> data = [];
    if (!fileExists) {
      await writeToFile(fileName, 'sep=~\n');
      data.add(columns);
    }

    // Add data to list
    List<String> rowData = [
      teamNumber,
      matchNumber,
      initials,
      allianceColour,
      autoScoredLow,
      autoScoredMid,
      autoScoredHigh,
      autoScoredMissed,
      autoMobility,
      autoBalance,
      autoBalanceTime,
      teleopScoredConeLow,
      teleopScoredConeMid,
      teleopScoredConeHigh,
      teleopConeDropped,
      teleopConeMissed,
      teleopScoredCubeLow,
      teleopScoredCubeMid,
      teleopScoredCubeHigh,
      teleopCubeDropped,
      teleopCubeMissed,
      teleopBalance,
      teleopBalanceTime,
      autoComments,
      preferenceComments,
      otherComments
    ];
    data.add(rowData);

    if (fileExists) {
      await writeToFile(fileName, "\n");
    }

    // Convert data to csv data and add ":" as field delimiter
    String csv = const ListToCsvConverter(fieldDelimiter: "~").convert(data);

    // Write to file
    await writeToFile(fileName, csv);
  }

  // Creates file in the app directory.
  static Future<File> createFileInAppDirectory(String fileName) async {
    final directory = Directory("/storage/emulated/0/Documents");
    final file = File('${directory.path}/$fileName');
    await file.create();
    return file;
  }

  // Creates and writes a string to a file in the app directory.
  static Future<File> writeToFile(String fileName, String fileContents) async {
    final file = await createFileInAppDirectory(fileName);
    return file.writeAsString(fileContents,
        flush: true, mode: FileMode.append); // write to file if exists
  }
}
