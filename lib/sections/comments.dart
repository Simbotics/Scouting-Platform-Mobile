import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_platform/sections/teamMatchInformation.dart';
import 'package:scouting_platform/sections/teleopScoutingData.dart';
import 'package:screenshot/screenshot.dart';

import '../ui/style/style.dart';
import '../utils/textInputField.dart';
import 'autoScoutingData.dart';

class CommentsSection extends StatefulWidget {
  const CommentsSection({
    Key? key,
  }) : super(key: key);

  @override
  _CommentsSectionState createState() => _CommentsSectionState();

  static final TextEditingController autoCommentsController =
      TextEditingController(text: "");
  static final TextEditingController preferenceCommentsController =
      TextEditingController(text: "");
  static final TextEditingController otherCommentsController =
      TextEditingController(text: "");

  static ScreenshotController screenshotController = ScreenshotController();
  static bool qrIsVisible = false;
}

class _CommentsSectionState extends State<CommentsSection> {
  @override
  void initState() {
    super.initState();
    // CommentsSection.autoComments = String.fromCharCodes(
    //     CommentsSection._autoComments.text.runes.toList().reversed);
    // CommentsSection.preferenceComments = String.fromCharCodes(
    //     CommentsSection._preferenceComments.text.runes.toList().reversed);
    // CommentsSection.otherComments = String.fromCharCodes(
    //     CommentsSection._otherComments.text.runes.toList().reversed);

    // CommentsSection._autoComments.selection = TextSelection.fromPosition(
    //     TextPosition(offset: CommentsSection._autoComments.text.length));
    // CommentsSection._preferenceComments.selection = TextSelection.fromPosition(
    //     TextPosition(offset: CommentsSection._preferenceComments.text.length));
    // CommentsSection._otherComments.selection = TextSelection.fromPosition(
    //     TextPosition(offset: CommentsSection._otherComments.text.length));
  }

  Future<Image>? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextInputField(
              margin: const EdgeInsets.only(left: 20.0),
              width: 400.0,
              height: 100.0,
              onChanged: (value) {
                setState(() {
                  CommentsSection.autoCommentsController.text = value;
                });
              },
              textAlign: TextAlign.justify,
              hintText: "Auto (Starting position? Routine? etc)",
              maxLines: 3,
            ),
            TextInputField(
              margin: const EdgeInsets.only(left: 20.0),
              width: 400.0,
              height: 100.0,
              onChanged: (value) {
                setState(() {
                  CommentsSection.preferenceCommentsController.text = value;
                });
              },
              textAlign: TextAlign.justify,
              hintText: "Preference (Cubes/Cones, Pickup Location, etc)",
              maxLines: 3,
            ),
            TextInputField(
              margin: const EdgeInsets.only(left: 20.0),
              width: 400.0,
              height: 100.0,
              onChanged: (value) {
                setState(() {
                  CommentsSection.otherCommentsController.text = value;
                });
              },
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
                    setState(() {
                      if (CommentsSection.qrIsVisible) {
                        CommentsSection.qrIsVisible = false;
                      } else {
                        CommentsSection.qrIsVisible = true;
                      }
                    });
                    await _captureAndSaveQRCode();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return const CurrentQRCode(title: "Current QR Code");
                    // }));
                  },
                  child: const Text(
                    'Save QR Code',
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
                    "${int.tryParse(TeamAndMatchData.teamNumberController.text) ?? 0},${int.tryParse(TeamAndMatchData.matchNumberController.text) ?? 0},${TeamAndMatchData.initialsController.text},${int.parse(AutoScoutingData.autoLowController.text)},${int.parse(AutoScoutingData.autoMidController.text)},${int.parse(AutoScoutingData.autoHighController.text)},${int.parse(AutoScoutingData.autoMissedController.text)},${int.parse(AutoScoutingData.autoDroppedController.text)},${AutoScoutingData.autoBalance},${formatTime(TeleopScoutingData.autoBalanceElapsedSeconds)},${int.parse(TeleopScoutingData.teleopConeLowController.text)},${int.parse(TeleopScoutingData.teleopConeMidController.text)},${int.parse(TeleopScoutingData.teleopConeHighController.text)},${int.parse(TeleopScoutingData.teleopConeMissedController.text)},${int.parse(TeleopScoutingData.teleopCubeLowController.text)},${int.parse(TeleopScoutingData.teleopCubeMidController.text)},${int.parse(TeleopScoutingData.teleopCubeHighController.text)},${int.parse(TeleopScoutingData.teleopCubeMissedController.text)},${TeleopScoutingData.teleopBalance},${formatTime(TeleopScoutingData.teleopBalanceElapsedSeconds)},${CommentsSection.autoCommentsController.text},${CommentsSection.preferenceCommentsController.text.toString()},${CommentsSection.otherCommentsController.text}",
                backgroundColor: Colors.white,
                version: QrVersions.auto,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<String> get imagePath async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    String fileName =
        "M${TeamAndMatchData.matchNumber}-${TeamAndMatchData.teamNumber}.csv"
            .replaceAll(" ", "");
    return '$directory/$fileName.png';
  }

  Future<Image> _loadImage() async {
    return await imagePath.then((imagePath) => Image.asset(imagePath));
  }

  Future<void> _captureAndSaveQRCode() async {
    final imageDirectory = await imagePath;

    CommentsSection.screenshotController.captureAndSave(imageDirectory);
    setState(() {
      image = _loadImage();
    });
  }

  String formatTime(int seconds) {
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${minutes.toString()}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}
