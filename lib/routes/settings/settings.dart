// ignore_for_file: file_names
import 'package:scouting_platform/textStyles/title.dart';
import 'package:flutter/material.dart';
import 'package:scouting_platform/routes/nav/navigationSidebar.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/builders/dropdownMenu.dart';
import 'package:scouting_platform/builders/textInputField.dart';
import 'package:scouting_platform/utils/data/qrCodeData.dart';
import 'package:scouting_platform/utils/data/scanningData.dart';
import 'package:scouting_platform/utils/data/schedulingData.dart';
import 'package:scouting_platform/utils/data/teamAndMatchData.dart';
import 'package:scouting_platform/utils/data/uiUtils.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    // Get the current event ID and current driver station from the file
    SchedulingData.getCurrentEventIDAndCurrentDriverStation()
        .then((value) => setState(() {
              // Once retrieved then set the text fields to the values
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
      backgroundColor: UIUtils.getBackgroundColour(),

      // Top navigation bar
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: AppStyle.textInputColor,
            title: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Futura'),
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
                  text: "Settings", padding: EdgeInsets.only(left: 10.0)),
              Row(children: [
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
              // Dropdown menu for the current driver station
              Row(children: [
                ScoutingDropdownMenu(
                    width: 150.0,
                    margin: const EdgeInsets.only(left: 10.0),
                    dropdownMenuSelectedItem:
                        SchedulingData.currentScoutingDriverStation,
                    onChanged: (value) {
                      // When the value is changed then set the current driver station to the value
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

                        // If the driver station starts with "Red" make alliance colour red, if it starts with "Blue" make alliance colour blue
                        if (SchedulingData.currentScoutingDriverStation
                            .startsWith("Red")) {
                          TeamAndMatchData.teamAlliance = "Red";
                        } else if (SchedulingData.currentScoutingDriverStation
                            .startsWith("Blue")) {
                          TeamAndMatchData.teamAlliance = "Blue";
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
              // Event ID text field
              Row(children: [
                TextInputField(
                    controller: SchedulingData.eventIDController,
                    margin: const EdgeInsets.only(left: 10.0),
                    onChanged: (value) async {
                      SchedulingData
                          .saveCurrentEventIDAndCurrentDriverStation();
                    },
                    textAlign: TextAlign.center,
                    hintText: "Event ID"),
              ]),
              // Fetch schedule button
              Row(children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding: const EdgeInsets.only(top: 24.0, left: 10.0),
                        height: 67.0,
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
              Row(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 170.0,
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: const Text(
                      "Current QR Centerfold",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              ]),
              // Dropdown menu for the QR centerfold
              Row(children: [
                ScoutingDropdownMenu(
                    width: 150.0,
                    margin: const EdgeInsets.only(left: 10.0),
                    dropdownMenuSelectedItem:
                        QRCodeData.currentlySelectedQRCenterfold,
                    onChanged: (value) {
                      setState(() {
                        QRCodeData.currentlySelectedQRCenterfold = value;
                        QRCodeData.currentlySelectedQRCenterfoldFileName =
                            value + "_centerfold.png";
                      });
                    },
                    dropdownItems: QRCodeData.qrCenterfoldDropdownOptions),
              ]),
              Row(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200.0,
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: const Text(
                      "Saved Spreadsheet Name",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              ]),
              // Current saving spreadsheet name text field
              Row(children: [
                TextInputField(
                    controller:
                        ScanningData.currentSavingSpreadsheetNameController,
                    margin: const EdgeInsets.only(left: 10.0),
                    onChanged: (value) {
                      setState(() {
                        ScanningData.currentSavingSpreadsheetName =
                            value + ".csv";
                      });
                    },
                    textAlign: TextAlign.center,
                    hintText: "Saved Spreadsheet Name"),
              ]),
              Row(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 170.0,
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: const Text(
                      "Is team number editable?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              ]),
              // Dropdown menu for if the team number is editable
              Row(children: [
                ScoutingDropdownMenu(
                    width: 150.0,
                    margin: const EdgeInsets.only(left: 10.0),
                    dropdownMenuSelectedItem:
                        TeamAndMatchData.isTeamNumberEditable,
                    onChanged: (value) {
                      // When the value is changed then set the is team number editable accordingly
                      setState(() {
                        TeamAndMatchData.isTeamNumberEditable = value;
                        if (TeamAndMatchData.isTeamNumberEditable == "Yes") {
                          TeamAndMatchData.isTeamNumberReadOnly = false;
                        } else {
                          TeamAndMatchData.isTeamNumberReadOnly = true;
                        }
                      });
                    },
                    dropdownItems: TeamAndMatchData.yesNoOptions),
              ]),
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
