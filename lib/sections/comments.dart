import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_platform/routes/qrcode/currentQRCode.dart';
import 'package:scouting_platform/utils/data/autoData.dart';
import 'package:scouting_platform/utils/data/commentsData.dart';
import 'package:scouting_platform/utils/data/teamAndMatchData.dart';
import 'package:scouting_platform/utils/data/teleopData.dart';
import 'package:screen_brightness/screen_brightness.dart';

import '../../ui/style/style.dart';
import '../../builders/textInputField.dart';

class CommentsSection extends StatefulWidget {
  const CommentsSection({
    Key? key,
  }) : super(key: key);

  @override
  _CommentsSectionState createState() => _CommentsSectionState();

  static bool qrIsVisible = false;
}

class _CommentsSectionState extends State<CommentsSection> {
  Future<Image>? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextInputField(
              controller: CommentsData.autoCommentsController,
              margin: const EdgeInsets.only(left: 20.0),
              width: 400.0,
              height: 100.0,
              onChanged: (value) {},
              textAlign: TextAlign.justify,
              hintText: "Auto (Starting position? Routine? etc)",
              maxLines: 3,
            ),
            TextInputField(
              controller: CommentsData.preferenceCommentsController,
              margin: const EdgeInsets.only(left: 20.0),
              width: 400.0,
              height: 100.0,
              onChanged: (value) {},
              textAlign: TextAlign.justify,
              hintText: "Preference (Cubes/Cones, Pickup Location, etc)",
              maxLines: 3,
            ),
            TextInputField(
              controller: CommentsData.otherCommentsController,
              margin: const EdgeInsets.only(left: 20.0),
              width: 400.0,
              height: 100.0,
              onChanged: (value) {},
              textAlign: TextAlign.justify,
              hintText: "Other (Anything else important)",
              maxLines: 3,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20.0),
                height: 47.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyle
                        .textInputColorLight, // Set the background color here
                  ),
                  onPressed: () async {
                    setBrightness(1.0);
                    setState(() {
                      CommentsSection.qrIsVisible = true;
                    });
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return const CurrentQRCode(title: "Current QR Code");
                    // }));
                  },
                  child: const Text(
                    'Update QR Code',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )),
          ],
        ),
        Visibility(
          visible: CommentsSection.qrIsVisible,
          child: Padding(
            padding: const EdgeInsets.only(left: 120.0, bottom: 60.0),
            child: SizedBox(
              width:
                  300.0, // set the width of the container as per your requirement
              child: QrImage(
                // Access variables through widget
                data:
                    "${int.tryParse(TeamAndMatchData.teamNumberController.text) ?? 0}:${int.tryParse(TeamAndMatchData.matchNumberController.text) ?? 0}:${TeamAndMatchData.initialsController.text}:${TeamAndMatchData.teamAlliance}:${int.parse(AutoData.autoLowController.text)}:${int.parse(AutoData.autoMidController.text)}:${int.parse(AutoData.autoHighController.text)}:${int.parse(AutoData.autoMissedController.text)}:${AutoData.currentAutoMobility}:${AutoData.currentAutoBalanceState}:${int.tryParse(TeleopData.autoBalanceTimeController.text) ?? 0}:${int.parse(TeleopData.teleopConeLowController.text)}:${int.parse(TeleopData.teleopConeMidController.text)}:${int.parse(TeleopData.teleopConeHighController.text)}:${int.parse(TeleopData.teleopConeMissedController.text)}:${int.parse(TeleopData.teleopConeDroppedController.text)}:${int.parse(TeleopData.teleopCubeLowController.text)}:${int.parse(TeleopData.teleopCubeMidController.text)}:${int.parse(TeleopData.teleopCubeHighController.text)}:${int.parse(TeleopData.teleopCubeMissedController.text)}:${int.parse(TeleopData.teleopCubeDroppedController.text)}:${TeleopData.currentTeleopBalanceState}:${int.tryParse(TeleopData.teleopBalanceTimeController.text) ?? 0}:${CommentsData.autoCommentsController.text.replaceAll("\n", "")}:${CommentsData.preferenceCommentsController.text.replaceAll("\n", "")}:${CommentsData.otherCommentsController.text.replaceAll("\n", "")}",
                backgroundColor: Colors.white,
                version: QrVersions.auto,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }
}
