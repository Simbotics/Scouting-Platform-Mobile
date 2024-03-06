// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/routes/dataInput/Comments/commentsRoute.dart';
import 'package:scouting_platform/routes/dataInput/fields/autoDataFields.dart';
import 'package:scouting_platform/routes/dataInput/fields/teleopDataFields.dart';
import 'package:scouting_platform/routes/dataInput/fields/endgameDataFields.dart';
import 'package:scouting_platform/routes/dataInput/labels/autoDataLabels.dart';
import 'package:scouting_platform/routes/dataInput/labels/teleopDataLabels.dart';
import 'package:scouting_platform/routes/dataInput/labels/endgameDataLabels.dart';
import 'package:scouting_platform/routes/teamAndMatchInfoRoute.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/data.dart';

class InputRoute extends StatefulWidget {
  const InputRoute({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _InputRouteState createState() => _InputRouteState();
}

class _InputRouteState extends State<InputRoute> {
  @override
  Widget build(BuildContext context) {
    return RoutePage(
      title: widget.title,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleStyle(
                  text: "Auto Data",
                  padding: EdgeInsets.only(top: 10.0, left: 20.0)),
              Padding(
                padding:
                    const EdgeInsets.only(right: 50.0, top: 10.0, left: 125.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150.0, 47.0),
                    backgroundColor: AppStyle.textInputColor,
                  ),
                  onPressed: () {
                    showConformationDialog(context);
                  },
                  child: const Text("Reset",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Helvetica",
                          color: Colors.white)),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.only(top: 4.0, right: 60),
                      // height: 47.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150.0, 47.0),
                          backgroundColor: AppStyle
                              .textInputColor, // Set the background color here
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const commentsRoute(title: "Comments");
                          }));
                        },
                        child: const Text("Comments >",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: "Helvetica",
                                color: Colors.white)),
                      ))),
            ],
          ),
          const Row1Labels(),
          const Row1Fields(),
          const Divider(color: AppStyle.redAlliance),
          const TitleStyle(
              text: "Teleop Data",
              padding: EdgeInsets.only(top: 10.0, left: 20.0)),
          const Row2Labels(),
          const Row2Fields(),
          const Divider(color: AppStyle.redAlliance),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleStyle(
                  text: "Endgame Data",
                  padding: EdgeInsets.only(top: 10.0, left: 20.0)),
            ],
          ),
          const Row3Labels(),
          const Row3Fields(),
        ]),
      ),
    );
  }

  showConformationDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        // Increment the match number
        if (Data.matchNumber.text != "") {
          Data.matchNumber.text =
              (int.parse(Data.matchNumber.text) + 1).toString();
        } else {
          Data.matchNumber.text = (2).toString();
        }

        if (Data.isTeamNumberReadOnly) {
          // Get the team number from the schedule and set the team number field to that
          Data.getTeamNumberFromSchedule(
                  int.parse(// Get the team number from the schedule
                      Data.matchNumber.text))
              .then(
                  (teamNumber) => Data.teamNumber.text = teamNumber.toString());
        }

        setState(() {
          Data.autoSpeakerScored.text = "0";
          Data.autoSpeakerMissed.text = "0";
          Data.autoAmpMissed.text = "0";
          Data.autoAmpScored.text = "0";
          Data.speaker.text = "0";
          Data.speakerMissed.text = "0";
          Data.amp.text = "0";
          Data.ampMissed.text = "0";
          Data.autoMobility.text = "No";
          Data.climb.text = "No";
          Data.climbTime.text = "0";
          Data.parked.text = "No";
          Data.harmony.text = "No";
          Data.trap.text = "0";
          Data.stopwatch.stop();
          Data.stopwatch.reset();
          Data.stopwatchState.text = "0";
          Data.autoComments.text = "";
          Data.autoOrder.text = "";
          Data.teleopComments.text = "";
          Data.endgameComments.text = "";
        });
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const teamAndMatchInfo(title: "Team and Match Data");
        }));
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirmation: Reset ALL Fields"),
      content: const Text(
          "Would you like to reset all of the fields current inputted?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
