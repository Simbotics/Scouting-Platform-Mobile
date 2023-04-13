// ignore_for_file: file_names
import 'package:scouting_platform/textStyles/title.dart';
import 'package:flutter/material.dart';
import 'package:scouting_platform/routes/nav/navigationSidebar.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/builders/dropdownMenu.dart';
import 'package:scouting_platform/builders/numberInputField.dart';
import 'package:scouting_platform/builders/textInputField.dart';
import 'package:scouting_platform/utils/data/schedulingData.dart';
import 'package:scouting_platform/utils/data/teamAndMatchData.dart';

import '../main.dart';

class TeamAndMatchInformation extends StatefulWidget {
  const TeamAndMatchInformation({Key? key}) : super(key: key);

  @override
  State<TeamAndMatchInformation> createState() =>
      _TeamAndMatchInformationState();
}

class _TeamAndMatchInformationState extends State<TeamAndMatchInformation> {
  @override
  void initState() {
    super.initState();
    SchedulingData.getCurrentEventIDAndCurrentDriverStation()
        .then((value) => setState(() {
              List<String> lineArray = value.split(",");
              SchedulingData.eventIDController.text = lineArray[0];
              SchedulingData.currentScoutingDriverStation = lineArray[1];
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navigation sidebar
      drawer: const NavigationSidebar(),
      // Background color and pixel resize fix
      backgroundColor: getBackgroundColour(),

      // Top navigation bar
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: AppStyle.textInputColor,
            title: const Text(
              "Scouting Platform - 2023",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Futura'),
            ),
          )),

      body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const TitleStyle(
                  text: "Team & Match Information",
                  padding: EdgeInsets.only(left: 10.0)),
              Row(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 170.0,
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: const Text(
                      "Team Number",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 170.0,
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: const Text(
                      "Current Driver Station",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              ]),
              Row(children: [
                NumberInputField(
                  readOnly: true,
                  onChanged: (value) {},
                  controller: TeamAndMatchData.teamNumberController,
                  hintText: "Team Number",
                ),
                const Spacer(),
                ScoutingDropdownMenu(
                    width: 150.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    dropdownMenuSelectedItem:
                        SchedulingData.currentScoutingDriverStation,
                    onChanged: (value) {
                      setState(() {
                        SchedulingData.currentScoutingDriverStation = value;
                        SchedulingData
                            .saveCurrentEventIDAndCurrentDriverStation();
                        if (TeamAndMatchData.matchNumberController.text != "") {
                          // If it isn't null
                          SchedulingData.getTeamNumberFromSchedule(int.parse(
                                  // Get the team number from the schedule
                                  TeamAndMatchData.matchNumberController.text))
                              .then((teamNumber) {
                            // Once retrieved then set the team number to the text field
                            TeamAndMatchData.teamNumberController.text =
                                teamNumber.toString();
                          });
                        }
                      });
                    },
                    dropdownItems: SchedulingData.driverStations),
              ]),
              Row(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200.0,
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: const Text(
                      "Alliance Colour",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200.0,
                    padding: const EdgeInsets.only(left: 41.0, top: 20),
                    child: const Text(
                      "Fetching Event ID",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              ]),
              Row(children: [
                ScoutingDropdownMenu(
                    width: 150.0,
                    margin: const EdgeInsets.only(left: 10.0),
                    dropdownMenuSelectedItem: TeamAndMatchData.teamAlliance,
                    onChanged: (value) {
                      setState(() {
                        TeamAndMatchData.teamAlliance = value;
                      });
                    },
                    dropdownItems: const ['Red', 'Blue']),
                const Spacer(),
                TextInputField(
                    controller: SchedulingData.eventIDController,
                    margin: const EdgeInsets.only(right: 10.0),
                    onChanged: (value) async {
                      SchedulingData
                          .saveCurrentEventIDAndCurrentDriverStation();
                    },
                    textAlign: TextAlign.center,
                    hintText: "Event ID"),
              ]),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 170.0,
                  padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                  child: const Text(
                    "Match Number",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
              ),
              Row(children: [
                NumberInputField(
                  onChanged: (value) async {
                    if (TeamAndMatchData.matchNumberController.text != "") {
                      // If it isn't null
                      SchedulingData.getTeamNumberFromSchedule(
                              int.parse(// Get the team number from the schedule
                                  TeamAndMatchData.matchNumberController.text))
                          .then((teamNumber) {
                        // Once retrieved then set the team number to the text field
                        TeamAndMatchData.teamNumberController.text =
                            teamNumber.toString();
                      });
                    }
                  },
                  controller: TeamAndMatchData.matchNumberController,
                  hintText: "Match Number",
                ),
                const Spacer(),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding: const EdgeInsets.only(top: 4.0, right: 10),
                        height: 47.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyle
                                .textInputColorLight, // Set the background color here
                          ),
                          onPressed: () {
                            // Fetched the schedule for the even ID from the github repo
                            showConfirmationDialog(context);
                          },
                          child: const Text(
                            'Fetch Schedule',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )))
              ]),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 170.0,
                  padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                  child: const Text(
                    "Scout Initials",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
              ),
              TextInputField(
                  controller: TeamAndMatchData.initialsController,
                  margin: const EdgeInsets.only(left: 10),
                  onChanged: (value) {},
                  textAlign: TextAlign.center,
                  hintText: "Scout Initials"),
              const SizedBox(height: 30.0),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.only(top: 4.0, right: 13),
                      height: 47.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppStyle
                              .textInputColorLight, // Set the background color here
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          }));
                        },
                        child: const Text(
                          'Auto/Teleop >',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )))
            ],
          )),
    );
  }
}

// The confirmation dialog to ensure they want to fetch the schedule
showConfirmationDialog(BuildContext context) {
  TextEditingController fieldController = TextEditingController(text: "");
  // set up the buttons
  Widget okButton = TextButton(
    child: const Text("Submit"),
    onPressed: () {
      if (fieldController.text != "I want to fetch the schedule") {
        // If the user didn't type the phrase correctly
        Navigator.of(context, rootNavigator: true).pop('dialog');
        showFailedDialog(context);
      } else {
        // If the user typed the phrase
        Navigator.of(context, rootNavigator: true).pop('dialog');
        SchedulingData.fetchEventSchedule();
      }
    },
  );
  Widget conformationInputField = TextField(
    controller: fieldController,
    decoration: const InputDecoration(
      hintText: 'Type "I want to fetch the schedule" here...',
      hintStyle: TextStyle(fontFamily: 'Helvetica', color: Colors.black),
      filled: true,
    ),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Confirmation: Please type the phrase below to confirm"),
    content: const Text(
      "This action will fetch the schedule from the github repo. This will not break anything, but be aware that\nthis will not work without internet. Be sure to check if the event ID is correct before fetching the schedule.",
    ),
    actions: [
      conformationInputField,
      okButton,
    ],
  ); // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// Show a dialog if the user didn't type the phrase correctly
showFailedDialog(BuildContext context) {
  // set up the buttons
  Widget okButton = TextButton(
    child: const Text("Ok"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Error: Incorrect field input"),
    content: const Text(
      "Error! The phrase you typed did not match the one you needed to type. Please try again.",
    ),
    actions: [
      okButton,
    ],
  ); // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Color getBackgroundColour() {
  switch (TeamAndMatchData.teamAlliance) {
    case "Blue":
      return AppStyle.blueAlliance;
    case "Red":
      return AppStyle.redAlliance;
    default:
      return AppStyle.redAlliance;
  }
}
