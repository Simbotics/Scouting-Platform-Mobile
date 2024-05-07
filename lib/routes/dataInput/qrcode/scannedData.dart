// ignore_for_file: file_names
import 'package:flutter/material.dart';
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
      required this.teleopPasses,
      required this.teleopEndgame,
      required this.teleopClimbTime,
      required this.teleopTrap,
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
  final String teleopPasses;
  final String teleopEndgame;
  final String teleopClimbTime;
  final String teleopTrap;
  final String autoComments;
  final String autoOrder;
  final String teleopComments;
  final String endgameComments;

  @override
  _scannedDataState createState() => _scannedDataState();
}

class _scannedDataState extends State<scannedData> {
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
                          style: const TextStyle(fontSize: 18)),
                      Text("Match Number: ${widget.matchNumber}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Initials: ${widget.initials}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Alliance Colour: ${widget.allianceColour}",
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Auto Speaker Scored: ${widget.autoSpeakerScored}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Auto Speaker Missed: ${widget.autoSpeakerMissed}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Auto Amp Scored: ${widget.autoAmpScored}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Auto Amp Missed: ${widget.autoAmpMissed}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Auto Mobility: ${widget.autoMobility}",
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          "Teleop Speaker Scored: ${widget.teleopSpeakerScored}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text(
                          "Teleop Speaker Missed: ${widget.teleopSpeakerMissed}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Teleop Amp Scored: ${widget.teleopAmpScored}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Teleop Amp Missed: ${widget.teleopAmpMissed}, ",
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Teleop Passes: ${widget.teleopPasses}",
                          style: const TextStyle(fontSize: 18)),
                      Text("Teleop Endgame: ${widget.teleopEndgame}",
                          style: const TextStyle(fontSize: 18)),
                      Text("Teleop Climb Time: ${widget.teleopClimbTime}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Teleop Trap: ${widget.teleopTrap}, ",
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Auto Comments: ${widget.autoComments}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Auto Order: ${widget.autoOrder}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Teleop Comments: ${widget.teleopComments}, ",
                          style: const TextStyle(fontSize: 18)),
                      Text("Endgame Comments: ${widget.endgameComments}",
                          style: const TextStyle(fontSize: 18))
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
                                    qrCodeScanning.barcodeStrings![21]))
                                .toList();
                            if (!Data.scannedDevices
                                .contains(qrCodeScanning.barcodeStrings![21])) {
                              Data.scannedDevices
                                  .add(qrCodeScanning.barcodeStrings![21]);
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
                              qrCodeScanning.barcodeStrings![20]);
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
