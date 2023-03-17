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
          barcodes = capture.barcodes; // Barcode(s) scanned
          //final Uint8List? image = capture.image; // Image of QR code
          for (final barcode in barcodes) {
            barcodeStrings = barcode.rawValue?.split(",");
            fileName = "M${barcodeStrings![1]}-${barcodeStrings![0]}.csv"
                .replaceAll(" ", "");

            // Prints the barcode scanned values
            debugPrint('Barcode found! ${barcode.rawValue}');

            // Stop the camera scanning then send the user to the "View Data" page.
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
                    allianceColour: barcodeStrings![3],
                    autoLow: barcodeStrings![4],
                    autoMid: barcodeStrings![5],
                    autoHigh: barcodeStrings![6],
                    autoMissed: barcodeStrings![7],
                    autoMobility: barcodeStrings![8],
                    autoBalance: barcodeStrings![9],
                    autoBalanceTime: barcodeStrings![10],
                    teleopConeLow: barcodeStrings![11],
                    teleopConeMid: barcodeStrings![12],
                    teleopConeHigh: barcodeStrings![13],
                    teleopConeMissed: barcodeStrings![14],
                    teleopConeDropped: barcodeStrings![15],
                    teleopCubeLow: barcodeStrings![16],
                    teleopCubeMid: barcodeStrings![17],
                    teleopCubeHigh: barcodeStrings![18],
                    teleopCubeMissed: barcodeStrings![19],
                    teleopCubeDropped: barcodeStrings![20],
                    teleopBalance: barcodeStrings![21],
                    teleopBalanceTime: barcodeStrings![22],
                    autoComments: barcodeStrings![23],
                    preferenceComments: barcodeStrings![24],
                    otherComments: barcodeStrings![25],
                    fileName: fileName,
                  ),
                )));
          }
        },
      ),
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
    List<List<String>> data = [
      [
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
      ],
      [
        // Team and match information
        teamNumber,
        matchNumber,
        initials,
        allianceColour,

        // Auto scored levels
        autoScoredLow,
        autoScoredMid,
        autoScoredHigh,
        autoScoredMissed,

        // Auto balance stats
        autoMobility,
        autoBalance,
        autoBalanceTime,

        // Teleop cone scored levels
        teleopScoredConeLow,
        teleopScoredConeMid,
        teleopScoredConeHigh,
        teleopConeDropped,
        teleopConeMissed,

        // Teleop cube scored levels
        teleopScoredCubeLow,
        teleopScoredCubeMid,
        teleopScoredCubeHigh,
        teleopCubeDropped,
        teleopCubeMissed,

        // Teleop balance stats
        teleopBalance,
        teleopBalanceTime,

        // Comments
        autoComments,
        preferenceComments,
        otherComments
      ],
    ];

    String csv = const ListToCsvConverter().convert(data);

    // File name for generated csv file
    fileName = "M$matchNumber-$teamNumber.csv".replaceAll(" ", "");

    // Write to file
    await writeToFile(fileName, csv);
  }

  // Creates file in the app directory.
  static Future<File> createFileInAppDirectory(String fileName) async {
    final directory = (await getExternalStorageDirectories())?.first;
    final file = File('${directory?.path}/$fileName');
    await file.create();
    return file;
  }

  // Creates and writes a string to a file in the app directory.
  static Future<File> writeToFile(String fileName, String fileContents) async {
    final file = await createFileInAppDirectory(fileName);
    if (kDebugMode) {
      print("Writing to file...");
    }
    return file.writeAsString(fileContents);
  }
}
