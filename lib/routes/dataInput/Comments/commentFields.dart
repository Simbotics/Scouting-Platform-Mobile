// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/fields/textInputField.dart';
import 'package:scouting_platform/routes/dataInput/qrcode/currentQRCode.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/data.dart';

class commentFields extends StatefulWidget {
  const commentFields({
    Key? key,
  }) : super(key: key);

  @override
  _commentFields createState() => _commentFields();
}

class _commentFields extends State<commentFields> {
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
              Data.autoComments.text = value;
            });
          },
          textAlign: TextAlign.left,
          hintText: "Ian is hot lol jk",
          controller: Data.autoComments,
          margin: const EdgeInsets.only(left: 40, top: 10),
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
              Data.autoOrder.text = value;
            });
          },
          textAlign: TextAlign.left,
          hintText: "Auto Note Order",
          controller: Data.autoOrder,
          margin: const EdgeInsets.only(left: 40, top: 10),
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
              Data.teleopComments.text = value;
            });
          },
          textAlign: TextAlign.left,
          hintText: "More stuff",
          controller: Data.teleopComments,
          margin: const EdgeInsets.only(left: 40, top: 10),
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
              Data.endgameComments.text = value;
            });
          },
          textAlign: TextAlign.left,
          hintText: "Final stuff",
          controller: Data.endgameComments,
          margin: const EdgeInsets.only(left: 40, top: 10, bottom: 20.0),
          width: 880,
          height: 90.0,
          maxLines: 10,
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
                padding:
                    const EdgeInsets.only(top: 4.0, right: 40, left: 80.0, bottom: 20.0),
                height: 80.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyle
                        .textInputColorLight, // Set the background color here
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CurrentQRCode(title: "QR Code");
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
