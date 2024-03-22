// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/fields/dropdownMenu.dart';
import 'package:scouting_platform/builders/fields/textInputField.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:scouting_platform/utils/data/data.dart';

class settingsRoute extends StatefulWidget {
  const settingsRoute({
    Key? key,
  }) : super(key: key);

  @override
  _settingsRoute createState() => _settingsRoute();
}

class _settingsRoute extends State<settingsRoute> {
  @override
  void initState() {
    super.initState();
    // Get the current event ID and current driver station from the file
    Data.getCurrentEventIDAndCurrentDriverStation()
        .then((value) => setState(() {
              // Once retrieved then set the text fields to the values
              List<String> lineArray = value.split(",");
              Data.eventID.text = lineArray[0];
              Data.driverStation = lineArray[1];
              Data.selectedDriverStation.text = lineArray[1];
            }));
  }

  @override
  Widget build(BuildContext context) {
    return RoutePage(
        title: "Settings",
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleStyle(
                    text: "Driver Station",
                    padding: EdgeInsets.only(left: 40, top: 10)),
                ScoutingDropdownMenu(
                    margin: const EdgeInsets.only(left: 40, top: 10),
                    dropdownMenuSelectedItem: Data.selectedDriverStation.text,
                    onChanged: (value) {
                      setState(() {
                        Data.driverStation = value;
                        Data.selectedDriverStation.text = value;
                        Data.saveCurrentEventIDAndCurrentDriverStation();
                        if (Data.matchNumber.text != "") {
                          // If it isn't null
                          Data.getTeamNumberFromSchedule(int.parse(
                              // Get the team number from the schedule
                              Data.matchNumber.text)).then((teamNumber) {
                            // Once retrieved then set the team number to the text field
                            Data.teamNumber.text = teamNumber.toString();
                          });
                        }

                        // If the driver station starts with "Red" make alliance colour red, if it starts with "Blue" make alliance colour blue
                        if (Data.driverStation.startsWith("Red")) {
                          Data.teamAlliance = "Red";
                        } else if (Data.driverStation.startsWith("Blue")) {
                          Data.teamAlliance = "Blue";
                        }
                      });
                    },
                    dropdownItems: Data.driverStations),
                const TitleStyle(
                    text: "Event ID",
                    padding: EdgeInsets.only(left: 40, top: 10)),
                TextInputField(
                    onChanged: (value) {
                      setState(() {
                        Data.eventID.text = value;
                        Data.saveCurrentEventIDAndCurrentDriverStation();
                      });
                    },
                    textAlign: TextAlign.left,
                    hintText: "Event ID",
                    controller: Data.eventID,
                    margin: const EdgeInsets.only(left: 40, top: 10)),
                const TitleStyle(
                    text: "File Name",
                    padding: EdgeInsets.only(left: 40, top: 10)),
                TextInputField(
                  onChanged: (value) {
                    setState(() {
                      Data.fileName.text = value;
                    });
                  },
                  textAlign: TextAlign.left,
                  hintText: "File Name",
                  controller: Data.fileName,
                  margin: const EdgeInsets.only(left: 40, top: 10),
                ),
                const TitleStyle(
                    text: "QR Code Centerfold",
                    padding: EdgeInsets.only(left: 40, top: 10)),
                ScoutingDropdownMenu(
                    margin: const EdgeInsets.only(left: 40, top: 10),
                    selectedItemFontSize: 10.0,
                    dropdownMenuSelectedItem:
                        Data.currentSelectedCenterfold.text,
                    onChanged: (value) {
                      setState(() {
                        Data.currentSelectedCenterfold.text = value;
                      });
                    },
                    dropdownItems: Data.centerfolds),
                const TitleStyle(
                    text: "Team Number Editable",
                    padding: EdgeInsets.only(left: 40, top: 10)),
                ScoutingDropdownMenu(
                    width: 150.0,
                    margin: const EdgeInsets.only(
                        left: 40.0, top: 10, bottom: 20.0),
                    dropdownMenuSelectedItem: Data.isTeamNumberEditable,
                    onChanged: (value) {
                      // When the value is changed then set the is team number editable accordingly
                      setState(() {
                        Data.isTeamNumberEditable = value;
                        if (Data.isTeamNumberEditable == "Yes") {
                          Data.isTeamNumberReadOnly = false;
                        } else {
                          Data.isTeamNumberReadOnly = true;
                        }
                      });
                    },
                    dropdownItems: Data.yesNoOptions),
              ],
            )));
  }
}
