// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scouting_platform/main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/autoData.dart';
import 'package:scouting_platform/utils/data/commentsData.dart';
import 'package:scouting_platform/utils/data/teamAndMatchData.dart';
import 'package:scouting_platform/utils/data/teleopData.dart';

class CurrentQRCode extends StatelessWidget {
  const CurrentQRCode({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return Scaffold(
      backgroundColor: getBackgroundColour(),
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
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }));
            },
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                //width: MediaQuery.of(context).size.width,
                child: QrImage(
                  // Access variables through widget
                  data: stringToBase64.encode(
                      "${int.tryParse(TeamAndMatchData.teamNumberController.text) ?? 0}~${int.tryParse(TeamAndMatchData.matchNumberController.text) ?? 0}~${TeamAndMatchData.initialsController.text}~${TeamAndMatchData.teamAlliance}~${int.parse(AutoData.autoLowController.text)}~${int.parse(AutoData.autoMidController.text)}~${int.parse(AutoData.autoHighController.text)}~${int.parse(AutoData.autoMissedController.text)}~${AutoData.currentAutoMobility}~${AutoData.currentAutoBalanceState}~${int.tryParse(TeleopData.autoBalanceTimeController.text) ?? 0}~${int.parse(TeleopData.teleopConeLowController.text)}~${int.parse(TeleopData.teleopConeMidController.text)}~${int.parse(TeleopData.teleopConeHighController.text)}~${int.parse(TeleopData.teleopConeMissedController.text)}~${int.parse(TeleopData.teleopConeDroppedController.text)}~${int.parse(TeleopData.teleopCubeLowController.text)}~${int.parse(TeleopData.teleopCubeMidController.text)}~${int.parse(TeleopData.teleopCubeHighController.text)}~${int.parse(TeleopData.teleopCubeMissedController.text)}~${int.parse(TeleopData.teleopCubeDroppedController.text)}~${TeleopData.currentTeleopBalanceState}~${int.tryParse(TeleopData.teleopBalanceTimeController.text) ?? 0}~${CommentsData.autoCommentsController.text.replaceAll("\n", "")}~${CommentsData.preferenceCommentsController.text.replaceAll("\n", "")}~${CommentsData.otherCommentsController.text.replaceAll("\n", "")}"),
                  backgroundColor: Colors.white,
                  version: QrVersions.auto,
                ),
              ),
            )),
      ),
    );
  }

  static String formatTime(int seconds) {
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${minutes.toString()}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  /// Gets the right background colour that needs to be displayed
  static Color getBackgroundColour() {
    switch (TeamAndMatchData.teamAlliance) {
      case "Blue":
        return AppStyle.blueAlliance;
      case "Red":
        return AppStyle.redAlliance;
      default:
        return AppStyle.redAlliance;
    }
  }
}
