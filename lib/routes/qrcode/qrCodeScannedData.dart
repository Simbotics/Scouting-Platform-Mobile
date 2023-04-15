// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/routes/qrcode/qrCodeScan.dart';
import 'package:scouting_platform/routes/qrcode/scannedDriverStations.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/scanningData.dart';

class ScannedQRCodeData extends StatefulWidget {
  const ScannedQRCodeData(
      {Key? key,
      // Match and team data
      required this.title, // The title of the page
      required this.teamNumber, // The team number
      required this.matchNumber, // The match number
      required this.initials, // The initials of the scout
      required this.allianceColour, // The alliance colour
      // Auto scoring
      required this.autoLow, // The number of low goals scored in auto
      required this.autoMid, // The number of mid goals scored in auto
      required this.autoHigh, // The number of high goals scored in auto
      required this.autoMissed, // The number of goals missed in auto
      // Auto balancing and mobility
      required this.autoMobility, // Whether the robot was mobile in auto
      required this.autoBalance, // Whether the robot was balanced in auto
      required this.autoBalanceTime, // The time the robot was balanced in auto
      // Teleop scoring
      required this.teleopConeLow, // The number of low cones scored in teleop
      required this.teleopConeMid, // The number of mid cones scored in teleop
      required this.teleopConeHigh, // The number of high goals scored in teleop
      required this.teleopConeDropped, // The number of cones dropped in teleop
      required this.teleopCubeLow, // The number of low cubes scored in teleop
      required this.teleopCubeMid, // The number of mid cubes scored in teleop
      required this.teleopCubeHigh, // The number of high cubes scored in teleop
      required this.teleopCubeDropped, // The number of cubes dropped in teleop
      required this.teleopChargingStationCrosses, // The number of times the robot crossed the charging station in teleop
      // Teleop balancing
      required this.teleopBalance, // How the robot did at balancing in teleop
      required this.teleopBalanceTime, // The time the robot took to balance in teleop
      // Comments
      required this.autoComments, // The comments on auto
      required this.preferenceComments, // The comments on preferences
      required this.otherComments, // The other comments
      required this.driverStationIdentifier, // The driver station identifier (0-5)
      required this.fileName // The name of the file
      })
      : super(key: key);

  // This pages information
  final String title; // The title of the page
  // Match and team data
  final String teamNumber; // The team number
  final String matchNumber; // The match number
  final String initials; // The initials of the scout
  final String allianceColour; // The alliance colour
  // Auto scoring
  final String autoLow; // The number of low goals scored in auto
  final String autoMid; // The number of mid goals scored in auto
  final String autoHigh; // The number of high goals scored in auto
  final String autoMissed; // The number of goals missed in auto
  // Auto balancing and mobility
  final String autoMobility; // Whether the robot was mobile in auto
  final String autoBalance; // The state of the balance in auto
  final String autoBalanceTime; // The time the robot took to balance in auto
  // Teleop scoring
  final String teleopConeLow; // The number of low cones scored in teleop
  final String teleopConeMid; // The number of mid cones scored in teleop
  final String teleopConeHigh; // The number of high goals scored in teleop
  final String teleopConeDropped; // The number of cones dropped in teleop
  final String teleopCubeLow; // The number of low cubes scored in teleop
  final String teleopCubeMid; // The number of mid cubes scored in teleop
  final String teleopCubeHigh; // The number of high cubes scored in teleop
  final String teleopCubeDropped; // The number of cubes dropped in teleop
  final String
      teleopChargingStationCrosses; // The number of times the robot crossed the charging station in teleop
  // Teleop balancing
  final String teleopBalance; // How the robot did at balancing in teleop
  final String
      teleopBalanceTime; // The time the robot took to balance in teleop
  // Comments
  final String autoComments; // The comments on auto
  final String preferenceComments; // The comments on preferences
  final String otherComments; // The other comments
  final String driverStationIdentifier; // The driver station identifier (0-5)
  final String fileName; // The name of the file
  @override
  State<ScannedQRCodeData> createState() => _ScannedQRCodeDataState();
}

class _ScannedQRCodeDataState extends State<ScannedQRCodeData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.redAlliance,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: AppBar(
              backgroundColor: AppStyle.textInputColor,
              title: Text(
                widget.title,
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
                      onPressed: () async {
                        setState(() {
                          ScanningData.unscannedDevices = ScanningData
                              .unscannedDevices
                              .where((element) => !element
                                  .contains(ScanQRCode.barcodeStrings![25]))
                              .toList();
                          ScanningData.scannedDevices
                              .add(ScanQRCode.barcodeStrings![25]);
                        });
                        await ScanQRCode.generateCsv(
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
                            ScanQRCode.barcodeStrings![22],
                            ScanQRCode.barcodeStrings![23],
                            ScanQRCode.barcodeStrings![24]);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ScannedDriverStations(
                            title: "Scanned Status",
                          );
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
                "Team #: ${widget.teamNumber}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Match #: ${widget.matchNumber}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Initials: ${widget.initials}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Alliance Colour: ${widget.allianceColour}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Low Scored: ${widget.autoLow}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Mid Scored: ${widget.autoMid}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto High Scored: ${widget.autoHigh}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Missed: ${widget.autoMissed}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Mobility: ${widget.autoMobility}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Balance: ${widget.autoBalance}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Balance Time: ${widget.autoBalanceTime}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Scored Cone Low: ${widget.teleopConeLow}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Scored Cone Mid: ${widget.teleopConeMid}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Scored Cone High: ${widget.teleopConeHigh}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cone Dropped: ${widget.teleopConeDropped}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cube Low: ${widget.teleopCubeLow}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cube Mid: ${widget.teleopCubeMid}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cube High: ${widget.teleopCubeHigh}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Cube Dropped: ${widget.teleopCubeDropped}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Charging Station Crosses: ${widget.teleopChargingStationCrosses}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Balance: ${widget.teleopBalance}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Teleop Balance Time: ${widget.teleopBalanceTime}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Auto Comments: ${widget.autoComments}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Preference Comments: ${widget.preferenceComments}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Other Comments: ${widget.otherComments}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   padding: const EdgeInsets.only(left: 15.0),
            //   child: Text(
            //     "Comments: $comments",
            //     textAlign: TextAlign.left,
            //     style: const TextStyle(fontSize: 13.5, color: Colors.white),
            //   ),
            // ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Generated CSV File Name: ${widget.fileName}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13.5, color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
