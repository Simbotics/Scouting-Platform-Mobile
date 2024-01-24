// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/routes/dataInput/qrcode/qrCodeScanning.dart';
import 'package:scouting_platform/routes/dataInput/qrcode/scannedDriverStations.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/data.dart';

class scannedData extends StatefulWidget {
  const scannedData(
      {Key? key,
      required this.title,
      required this.teamNumber,
      required this.matchNumber,
      required this.initials,
      required this.allianceColour,
      required this.autoSpeakerScored,
      required this.autoSpeakerMissed,
      required this.autoAmpScored,
      required this.autoAmpMissed,
      required this.autoMobility,
      required this.teleopSpeakerScored,
      required this.teleopSpeakerMissed,
      required this.teleopAmpScored,
      required this.teleopAmpMissed,
      required this.teleopClimb,
      required this.teleopClimbTime,
      required this.teleopTrap,
      required this.teleopSpotlight,
      required this.autoComments,
      required this.teleopComments,
      required this.endgameComments})
      : super(key: key);

  final String title;
  final String teamNumber;
  final String matchNumber;
  final String initials;
  final String allianceColour;
  final String autoSpeakerScored;
  final String autoSpeakerMissed;
  final String autoAmpScored;
  final String autoAmpMissed;
  final String autoMobility;
  final String teleopSpeakerScored;
  final String teleopSpeakerMissed;
  final String teleopAmpScored;
  final String teleopAmpMissed;
  final String teleopClimb;
  final String teleopClimbTime;
  final String teleopTrap;
  final String teleopSpotlight;
  final String autoComments;
  final String teleopComments;
  final String endgameComments;

  @override
  _scannedDataState createState() => _scannedDataState();
}

class _scannedDataState extends State<scannedData> {
  // The scanned QR code data split into an array
  static late List<String>? barcodeStrings;
  // Array of barcodes scannned
  static late List<Barcode> barcodes;
  // Name of file generated when scanned
  static late String fileName;

  @override
  Widget build(BuildContext context) {
    return RoutePage(
        title: widget.title,
        body: Container(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: const EdgeInsets.only(top: 18.0, right: 60.0),
                height: 77.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyle
                        .textInputColorLight, // Set the background color here
                  ),
                  onPressed: () async {
                    setState(() {
                      Data.unscannedDevices = Data.unscannedDevices
                          .where((element) => !element
                              .contains(qrCodeScanning.barcodeStrings![19]))
                          .toList();
                      Data.scannedDevices
                          .add(qrCodeScanning.barcodeStrings![19]);
                    });
                    await qrCodeScanning.generateCsv(
                        qrCodeScanning.barcodeStrings![0],
                        qrCodeScanning.barcodeStrings![1],
                        qrCodeScanning.barcodeStrings![2],
                        qrCodeScanning.barcodeStrings![3],
                        qrCodeScanning.barcodeStrings![4],
                        qrCodeScanning.barcodeStrings![5],
                        qrCodeScanning.barcodeStrings![6],
                        qrCodeScanning.barcodeStrings![7],
                        qrCodeScanning.barcodeStrings![8],
                        qrCodeScanning.barcodeStrings![9],
                        qrCodeScanning.barcodeStrings![10],
                        qrCodeScanning.barcodeStrings![11],
                        qrCodeScanning.barcodeStrings![12],
                        qrCodeScanning.barcodeStrings![13],
                        qrCodeScanning.barcodeStrings![14],
                        qrCodeScanning.barcodeStrings![15],
                        qrCodeScanning.barcodeStrings![16],
                        qrCodeScanning.barcodeStrings![17],
                        qrCodeScanning.barcodeStrings![18],
                        qrCodeScanning.barcodeStrings![19]);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const scannedDriverStations(
                        title: "Scanned Status",
                      );
                    }));
                  },
                  child: const Text(
                    'Save QR Code Data',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ))));
  }
}
