// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_platform/ui/style/style.dart';

import '../../sections/autoScoutingData.dart';
import '../../sections/comments.dart';
import '../../sections/teamMatchInformation.dart';
import '../../sections/teleopScoutingData.dart';

class CurrentQRCode extends StatelessWidget {
  const CurrentQRCode({Key? key, required this.title}) : super(key: key);
  final String title;

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
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            }));
          },
          child: Center(
            child: QrImage(
              // Access variables through widget
              data:
                  "${TeamAndMatchData.teamNumber},${TeamAndMatchData.matchNumber},${TeamAndMatchData.initials},${int.parse(AutoScoutingData.autoLowController.text)},${int.parse(AutoScoutingData.autoMidController.text)},${int.parse(AutoScoutingData.autoHighController.text)},${int.parse(AutoScoutingData.autoMissedController.text)},${int.parse(AutoScoutingData.autoDroppedController.text)},${AutoScoutingData.autoBalance},${formatTime(TeleopScoutingData.autoBalanceElapsedSeconds)},${int.parse(TeleopScoutingData.teleopConeLowController.text)},${int.parse(TeleopScoutingData.teleopConeMidController.text)},${int.parse(TeleopScoutingData.teleopConeHighController.text)},${int.parse(TeleopScoutingData.teleopConeMissedController.text)},${int.parse(TeleopScoutingData.teleopCubeLowController.text)},${int.parse(TeleopScoutingData.teleopCubeMidController.text)},${int.parse(TeleopScoutingData.teleopCubeHighController.text)},${int.parse(TeleopScoutingData.teleopCubeMissedController.text)},${TeleopScoutingData.teleopBalance},${formatTime(TeleopScoutingData.teleopBalanceElapsedSeconds)},${CommentsSection.autoCommentsController.text},${CommentsSection.preferenceCommentsController.text},${CommentsSection.otherCommentsController.text}",
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              size: 300.0,
            ),
          ),
        ),
      ),
    );
  }

  static String formatTime(int seconds) {
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${minutes.toString()}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}
