// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/qrcode/ScannedDataPreviewRoute.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

class QRCodeScanningRoute extends StatelessWidget {
  const QRCodeScanningRoute({super.key, required this.title});
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
    UIHelper.setBrightness(0.3);

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
                    List<int> decodedBytes = base64.decode(barcode.rawValue!);
                    String decodedBarcodeString = utf8.decode(decodedBytes);
                    barcodeStrings = decodedBarcodeString.split("^");
                    fileName = SettingValues.getCurrentSavingSpreadsheetName();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScannedDataPreviewRoute(
                                title: 'Scanned QR Code Data',
                                data: barcodeStrings!)));

                    cameraController.stop();
                  }
                }
              })),
    );
  }
}
