// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/TextInputField.dart';
import 'package:scouting_platform/routes/qrcode/QRCodeRoute.dart';
import 'package:scouting_platform/routes/teleop/TeleopRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/styles/components/TitleStyle.dart';
import 'package:scouting_platform/utils/data/values/CommentValues.dart';

class CommentsFields extends StatefulWidget {
  const CommentsFields({
    super.key,
  });

  @override
  State<CommentsFields> createState() => _CommentsFields();
}

class _CommentsFields extends State<CommentsFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TitleStyle(
                text: "Auto Comments",
                padding: EdgeInsets.only(top: 10.0, left: 18.0)),
            Row(children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150.0, 37.0),
                        padding: const EdgeInsets.all(15),
                        backgroundColor: AppStyle.textInputColor,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const TeleopRoute(title: "Teleop");
                        }));
                      },
                      child: const Text("< Teleop",
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                    ),
                  )),
              const SizedBox(width: 10.0),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(3.0),
                    margin: const EdgeInsets.only(right: 5.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150.0, 37.0),
                        padding: const EdgeInsets.all(15),
                        backgroundColor: AppStyle.textInputColor,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const QRCodeRoute(title: "QR Code");
                        }));
                      },
                      child: const Text("Current QR Code >",
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                    ),
                  )),
            ]),
          ],
        ),
        TextInputField(
          onChanged: (value) {
            setState(() {
              CommentValues.autoComments.text = value;
            });
          },
          textAlign: TextAlign.left,
          hintText:
              "Speed, reliability, etc. Keep this 1-2 sentences and brief",
          controller: CommentValues.autoComments,
          margin: const EdgeInsets.only(left: 18, top: 10),
          width: 880,
          height: 90.0,
          maxLines: 10,
        ),
        const TitleStyle(
            text: "Teleop Comments",
            padding: EdgeInsets.only(top: 10.0, left: 18.0)),
        TextInputField(
          onChanged: (value) {
            setState(() {
              CommentValues.teleopComments.text = value;
            });
          },
          textAlign: TextAlign.left,
          hintText:
              "Speed, fuel reliability, etc. Keep this 1-2 sentences and brief",
          controller: CommentValues.teleopComments,
          margin: const EdgeInsets.only(left: 18, top: 10),
          width: 880,
          height: 90.0,
          maxLines: 10,
        ),
        const TitleStyle(
            text: "End Game Comments",
            padding: EdgeInsets.only(top: 10.0, left: 18.0)),
        TextInputField(
          onChanged: (value) {
            setState(() {
              CommentValues.endgameComments.text = value;
            });
          },
          textAlign: TextAlign.left,
          hintText:
              "Climb, park, any troubles, etc. Keep this 1-2 sentences and brief",
          controller: CommentValues.endgameComments,
          margin: const EdgeInsets.only(left: 18, top: 10, bottom: 20.0),
          width: 880,
          height: 90.0,
          maxLines: 10,
        ),
      ],
    );
  }
}
