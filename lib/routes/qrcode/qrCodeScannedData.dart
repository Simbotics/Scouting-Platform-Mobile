// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/main.dart';
import 'package:scouting_platform/routes/qrcode/qrCodeScan.dart';
import 'package:scouting_platform/ui/style/style.dart';

class ScannedQRCodeData extends StatelessWidget {
  const ScannedQRCodeData(
      {Key? key,
      required this.title,
      required this.teamNumber,
      required this.matchNumber,
      required this.initials,
      required this.autoLow,
      required this.autoMid,
      required this.autoHigh,
      required this.autoMissed,
      required this.autoDropped,
      required this.balancedInAuto,
      required this.balancedAutoTime,
      required this.teleopConeLow,
      required this.teleopConeMid,
      required this.teleopConeHigh,
      required this.teleopConeMissed,
      required this.teleopCubeLow,
      required this.teleopCubeMid,
      required this.teleopCubeHigh,
      required this.teleopCubeMissed,
      required this.balancedInTeleop,
      required this.balancedTeleopTime,
      required this.autoComments,
      required this.preferenceComments,
      required this.otherComments,
      required this.fileName})
      : super(key: key);
  final String title;
  final String teamNumber;
  final String matchNumber;
  final String initials;
  final String autoLow;
  final String autoMid;
  final String autoHigh;
  final String autoMissed;
  final String autoDropped;
  final String balancedInAuto;
  final String balancedAutoTime;
  final String teleopConeLow;
  final String teleopConeMid;
  final String teleopConeHigh;
  final String teleopConeMissed;
  final String teleopCubeLow;
  final String teleopCubeMid;
  final String teleopCubeHigh;
  final String teleopCubeMissed;
  final String balancedInTeleop;
  final String balancedTeleopTime;
  final String autoComments;
  final String preferenceComments;
  final String otherComments;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.primaryColor,
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
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: const Text(
                    "Scanned QR Code Data",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Container(
                    padding: const EdgeInsets.only(top: 18.0, right: 60.0),
                    height: 77.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppStyle
                            .textInputColorLight, // Set the background color here
                      ),
                      onPressed: () {
                        ScanQRCode.generateCsv(
                            ScanQRCode.barcodeStrings![0],
                            ScanQRCode.barcodeStrings![1],
                            ScanQRCode.barcodeStrings![2],
                            ScanQRCode.barcodeStrings![3],
                            ScanQRCode.barcodeStrings![4],
                            ScanQRCode.barcodeStrings![5],
                            ScanQRCode.barcodeStrings![6],
                            ScanQRCode.barcodeStrings![7],
                            ScanQRCode.barcodeStrings![8],
                            ScanQRCode.barcodeStrings![9],
                            ScanQRCode.barcodeStrings![10],
                            ScanQRCode.barcodeStrings![11],
                            ScanQRCode.barcodeStrings![12],
                            ScanQRCode.barcodeStrings![13],
                            ScanQRCode.barcodeStrings![14],
                            ScanQRCode.barcodeStrings![15],
                            ScanQRCode.barcodeStrings![16],
                            ScanQRCode.barcodeStrings![17],
                            ScanQRCode.barcodeStrings![18],
                            ScanQRCode.barcodeStrings![19],
                            ScanQRCode.barcodeStrings![20],
                            ScanQRCode.barcodeStrings![21],
                            ScanQRCode.barcodeStrings![22]);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      },
                      child: const Text(
                        'Save QR Code Data',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ))
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 15.0, left: 15.0),
              child: Text(
                "Team #: $teamNumber",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Match #: $matchNumber",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Initials: $initials",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Low Scored: $autoLow",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Mid Scored: $autoMid",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto High Scored: $autoHigh",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Missed: $autoMissed",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Dropped: $autoDropped",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Balanced In Auto: $balancedInAuto",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Balanced Auto Time: $balancedAutoTime",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Scored Cone Low: $teleopConeLow",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Scored Cone Mid: $teleopConeMid",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Scored Cone High: $teleopConeHigh",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cone Missed: $teleopConeMissed",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cube Low: $teleopCubeLow",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cube Mid: $teleopCubeMid",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cube High: $teleopCubeHigh",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cube Missed: $teleopCubeMissed",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Balanced In Teleop: $balancedInTeleop",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Balance Time: $balancedTeleopTime",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Comments: $autoComments",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Preference Comments: $preferenceComments",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Other Comments: $otherComments",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   padding: const EdgeInsets.only(left: 15.0),
            //   child: Text(
            //     "Comments: $comments",
            //     textAlign: TextAlign.left,
            //     style: const TextStyle(fontSize: 15.0, color: Colors.white),
            //   ),
            // ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Generated CSV File Name: $fileName",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
