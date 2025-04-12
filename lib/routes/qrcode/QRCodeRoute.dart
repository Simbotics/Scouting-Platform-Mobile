// ignore_for_file: prefer_const_constructors, file_names, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_platform/utils/helpers/QRCodeHelper.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/helpers/AppDataHelper.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/routes/comments/CommentsRoute.dart';

class QRCodeRoute extends StatefulWidget {
  const QRCodeRoute({super.key, required this.title});
  final String title;

  @override
  _QRCodeRouteState createState() => _QRCodeRouteState();
}

class _QRCodeRouteState extends State<QRCodeRoute> {
  @override
  Widget build(BuildContext context) {
    UIHelper.setBrightness(1.0);

    return PlatformRoute(
      title: widget.title,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: QrImageView(
                data: QrcodeHelper.getQRCodeString(),
                backgroundColor: Colors.white,
                errorCorrectionLevel: QrErrorCorrectLevel.L,
                version: QrVersions.auto,
              ),
            ),
          ),
          Positioned(
            top: 5.0,
            left: 5.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150.0, 37.0),
                padding: EdgeInsets.all(15.0),
                backgroundColor: AppStyle.textInputColor,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CommentsRoute(title: "Comments");
                }));
              },
              child: const Text(
                "< Comments",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Helvetica",
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 5.0,
            right: 5.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150.0, 37.0),
                padding: EdgeInsets.all(15.0),
                backgroundColor: AppStyle.textInputColor,
              ),
              onPressed: () {
                showConformationDialog(context);
              },
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Helvetica",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showConformationDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        if (PrematchValues.matchNumber.text != "") {
          PrematchValues.matchNumber.text =
              (int.parse(PrematchValues.matchNumber.text) + 1).toString();
        } else {
          PrematchValues.matchNumber.text = (2).toString();
        }

        if (SettingValues.isTeamNumberReadOnly) {
          Schedulehelper.getTeamNumberFromSchedule(
            int.parse(PrematchValues.matchNumber.text),
          ).then((teamNumber) =>
              PrematchValues.teamNumber.text = teamNumber.toString());
        }

        setState(() {
          AppDataHelper.resetStates();
        });
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return const PrematchRoute(title: "Prematch Data");
        }), (r) => false);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Confirmation: Reset ALL Fields"),
      content: const Text(
          "Would you like to reset all of the fields currently inputted?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
