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
      required this.teleopParked,
      required this.teleopHarmony,
      required this.autoComments,
      required this.autoOrder,
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
  final String teleopParked;
  final String teleopHarmony;
  final String autoComments;
  final String autoOrder;
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
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
                // padding: const EdgeInsets.only(top: 18.0, right: 60.0),
                // height: 77.0,
                children: [
                  Row(
                    children: [
                      Text("Team Number: ${widget.teamNumber}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Match Number: ${widget.matchNumber}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Initials: ${widget.initials}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Alliance Colour: ${widget.allianceColour}",
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Auto Speaker Scored: ${widget.autoSpeakerScored}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Auto Speaker Missed: ${widget.autoSpeakerMissed}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Auto Amp Scored: ${widget.autoAmpScored}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Auto Amp Missed: ${widget.autoAmpMissed}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Auto Mobility: ${widget.autoMobility}",
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          "Teleop Speaker Scored: ${widget.teleopSpeakerScored}, ",
                          style: TextStyle(fontSize: 18)),
                      Text(
                          "Teleop Speaker Missed: ${widget.teleopSpeakerMissed}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Teleop Amp Scored: ${widget.teleopAmpScored}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Teleop Amp Missed: ${widget.teleopAmpMissed}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Teleop Climb: ${widget.teleopClimb}",
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Teleop Climb Time: ${widget.teleopClimbTime}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Teleop Trap: ${widget.teleopTrap}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Teleop Parked: ${widget.teleopParked}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Teleop Harmony: ${widget.teleopHarmony}, ",
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Auto Comments: ${widget.autoComments}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Auto Order: ${widget.autoOrder}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Teleop Comments: ${widget.teleopComments}, ",
                          style: TextStyle(fontSize: 18)),
                      Text("Endgame Comments: ${widget.endgameComments}",
                          style: TextStyle(fontSize: 18))
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppStyle
                              .textInputColorLight, // Set the background color here
                        ),
                        onPressed: () async {
                          setState(() {
                            Data.unscannedDevices = Data.unscannedDevices
                                .where((element) => !element.contains(
                                    qrCodeScanning.barcodeStrings![22]))
                                .toList();
                            if (!Data.scannedDevices
                                .contains(qrCodeScanning.barcodeStrings![22])) {
                              Data.scannedDevices
                                  .add(qrCodeScanning.barcodeStrings![22]);
                            }
                          });
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const scannedDriverStations(
                              title: "Scanned Status",
                            );
                          }));
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
                              qrCodeScanning.barcodeStrings![19],
                              qrCodeScanning.barcodeStrings![20],
                              qrCodeScanning.barcodeStrings![21]);
                        },
                        child: const Text(
                          'Save QR Code Data',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: "Helvetica",
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ])));
  }
}
