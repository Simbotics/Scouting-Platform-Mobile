// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/TextInputField.dart';
import 'package:scouting_platform/routes/qrcode/QRCodeRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/styles/TitleStyle.dart';
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
        const TitleStyle(
            text: "Auto Comments",
            padding: EdgeInsets.only(top: 10.0, left: 18.0)),
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
            text: "Auto Note Order",
            padding: EdgeInsets.only(top: 10.0, left: 18.0)),
        TextInputField(
          onChanged: (value) {
            setState(() {
              CommentValues.autoOrder.text = value;
            });
          },
          textAlign: TextAlign.left,
          hintText:
              "1, 2, 3, 4, 5. One being the top of the field from your point of view and five being the bottom",
          controller: CommentValues.autoOrder,
          margin: const EdgeInsets.only(left: 18, top: 10),
          width: 880,
          height: 45.0,
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
              "Speed, speaker reliability, amping, etc. Keep this 1-2 sentences and brief",
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
              "Climb, trap, park, harmony, etc. Keep this 1-2 sentences and brief",
          controller: CommentValues.endgameComments,
          margin: const EdgeInsets.only(left: 18, top: 10, bottom: 20.0),
          width: 880,
          height: 90.0,
          maxLines: 10,
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
                padding: const EdgeInsets.only(
                    top: 4.0, right: 40, left: 80.0, bottom: 20.0),
                height: 80.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyle
                        .textInputColorLight, // Set the background color here
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const QRCodeRoute(title: "QR Code");
                    }));
                  },
                  child: const Text("Current QR Code >",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: "Helvetica",
                          color: Colors.white)),
                )))
      ],
    );
  }
}
