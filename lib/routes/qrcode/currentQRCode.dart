// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:remove_emoji/remove_emoji.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/autoData.dart';
import 'package:scouting_platform/utils/data/commentsData.dart';
import 'package:scouting_platform/utils/data/qrCodeData.dart';
import 'package:scouting_platform/utils/data/schedulingData.dart';
import 'package:scouting_platform/utils/data/teamAndMatchData.dart';
import 'package:scouting_platform/utils/data/teleopData.dart';
import 'package:scouting_platform/utils/data/uiUtils.dart';

class CurrentQRCode extends StatefulWidget {
  const CurrentQRCode({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CurrentQRCode> createState() => _CurrentQRCodeState();
}

class _CurrentQRCodeState extends State<CurrentQRCode> {
  @override
  void initState() {
    super.initState();
    // Based on what station they are scouting, set the driver station identifier
    // to a number between 0 and 5. This is used to determine which device has been scanned.
    switch (SchedulingData.currentScoutingDriverStation) {
      case "Red 1":
        setState(() {
          SchedulingData.driverStationIdentifier = 0;
        });
        break;
      case "Red 2":
        setState(() {
          SchedulingData.driverStationIdentifier = 1;
        });
        break;
      case "Red 3":
        setState(() {
          SchedulingData.driverStationIdentifier = 2;
        });
        break;
      case "Blue 1":
        setState(() {
          SchedulingData.driverStationIdentifier = 3;
        });
        break;
      case "Blue 2":
        setState(() {
          SchedulingData.driverStationIdentifier = 4;
        });
        break;
      case "Blue 3":
        setState(() {
          SchedulingData.driverStationIdentifier = 5;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    RemoveEmoji remove =
        RemoveEmoji(); // Create an instance of the RemoveEmoji class
    // UTF-8 encode the data to be sent to the QR code (cleaned of all emoji's)
    List<int> encoded = utf8.encode(remove.clean(
        "${int.tryParse(TeamAndMatchData.teamNumberController.text) ?? 0}~${int.tryParse(TeamAndMatchData.matchNumberController.text) ?? 0}~${TeamAndMatchData.initialsController.text}~${TeamAndMatchData.teamAlliance}~${int.parse(AutoData.autoLowController.text)}~${int.parse(AutoData.autoMidController.text)}~${int.parse(AutoData.autoHighController.text)}~${int.parse(AutoData.autoMissedController.text)}~${AutoData.currentAutoMobility}~${AutoData.currentAutoBalanceState}~${int.tryParse(TeleopData.autoBalanceTimeController.text) ?? 0}~${int.parse(TeleopData.teleopConeLowController.text)}~${int.parse(TeleopData.teleopConeMidController.text)}~${int.parse(TeleopData.teleopConeHighController.text)}~${int.parse(TeleopData.teleopConeDroppedController.text)}~${int.parse(TeleopData.teleopCubeLowController.text)}~${int.parse(TeleopData.teleopCubeMidController.text)}~${int.parse(TeleopData.teleopCubeHighController.text)}~${int.parse(TeleopData.teleopCubeDroppedController.text)}~${int.tryParse(TeleopData.teleopChargingStationCrossesController.text)}~${TeleopData.currentTeleopBalanceState}~${int.tryParse(TeleopData.teleopBalanceTimeController.text) ?? 0}~${CommentsData.autoCommentsController.text.replaceAll("\n", "")}~${CommentsData.preferenceCommentsController.text.replaceAll("\n", "")}~${CommentsData.otherCommentsController.text.replaceAll("\n", "")}~${SchedulingData.driverStationIdentifier}"));
    // Encode the data in base64 to make it more compact
    String base64String = base64.encode(encoded);
    return Scaffold(
      backgroundColor: UIUtils.getBackgroundColour(),
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
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context)
              .size
              .height, // Fit to fill the whole screen
          child: QrImage(
              // Access variables through widget
              data: base64String, // QR code data (the encoded string)
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              errorCorrectionLevel: QrErrorCorrectLevel.L,
              // Set the centerfold image
              embeddedImage: AssetImage("assets/images/centerfolds/" +
                  QRCodeData.currentlySelectedQRCenterfoldFileName)),
        ),
      ),
    );
  }
}
