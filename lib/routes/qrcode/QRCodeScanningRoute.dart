// ignore_for_file: file_names
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/qrcode/ScannedDataPreviewRoute.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class QRCodeScanningRoute extends StatefulWidget {
  const QRCodeScanningRoute({super.key, required this.title});
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _QRCodeScanningRouteState createState() => _QRCodeScanningRouteState();
}

class _QRCodeScanningRouteState extends State<QRCodeScanningRoute>
    with WidgetsBindingObserver {
  final MobileScannerController cameraController = MobileScannerController();

  // Make barcodeStrings a static property
  static List<String>? barcodeStrings;
  List<Barcode>? barcodes;
  String? fileName;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();

    unawaited(cameraController.start());
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    await cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformRoute(
      title: widget.title,
      body: RotatedBox(
        quarterTurns: -1, // Fix rotation being messed up
        child: MobileScanner(
          fit: BoxFit.contain,
          controller: cameraController,
          onDetect: (capture) {
            setState(() {
              barcodes = capture.barcodes; // Barcode(s) scanned
            });
            for (final barcode in barcodes!) {
              if (barcode.rawValue != null) {
                // Decode the scanned QR code data
                List<int> decodedBytes = base64.decode(barcode.rawValue!);
                String decodedBarcodeString = utf8.decode(decodedBytes);
                barcodeStrings = decodedBarcodeString
                    .split("^"); // Assign to static property
                fileName = SettingValues.getCurrentSavingSpreadsheetName();

                // Navigate to the preview route
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScannedDataPreviewRoute(
                      title: 'Scanned QR Code Data',
                      data: barcodeStrings!,
                    ),
                  ),
                );

                // Stop the scanner after a successful scan
                cameraController.stop();
                break; // Stop after the first valid scan
              }
            }
          },
        ),
      ),
    );
  }
}
