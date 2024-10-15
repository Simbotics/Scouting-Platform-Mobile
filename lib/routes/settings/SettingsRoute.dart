// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/builders/bases/TextInputField.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/styles/components/TitleStyle.dart';
import 'package:scouting_platform/utils/helpers/AppDataHelper.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class SettingsRoute extends StatefulWidget {
  const SettingsRoute({
    super.key,
  });

  @override
  State<SettingsRoute> createState() => _SettingsRoute();
}

class _SettingsRoute extends State<SettingsRoute> {
  @override
  void initState() {
    super.initState();
    // Get the current event ID and current driver station from the file
    AppDataHelper.getCurrentEventIDAndCurrentDriverStation()
        .then((value) => setState(() {
              if (value != "") {
                // Once retrieved then set the text fields to the values
                List<String> lineArray = value.split(",");
                SettingValues.eventID.text = lineArray[0];
                SettingValues.selectedDriverStation.text = lineArray[1];
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return PlatformRoute(
        title: "Settings",
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const TitleStyle(
                            text: "Driver Station",
                            padding: EdgeInsets.only(top: 10)),
                        PlatformDropdownMenu(
                            margin: const EdgeInsets.only(left: 30, top: 10),
                            dropdownMenuSelectedItem:
                                SettingValues.selectedDriverStation.text,
                            onChanged: (value) {
                              setState(() {
                                SettingValues.selectedDriverStation.text =
                                    value;
                                AppDataHelper
                                    .saveCurrentEventIDAndCurrentDriverStation();
                                if (PrematchValues.matchNumber.text != "") {
                                  // If it isn't null
                                  Schedulehelper.getTeamNumberFromSchedule(
                                          int.parse(
                                              // Get the team number from the schedule
                                              PrematchValues.matchNumber.text))
                                      .then((teamNumber) {
                                    // Once retrieved then set the team number to the text field
                                    PrematchValues.teamNumber.text =
                                        teamNumber.toString();
                                  });
                                }

                                // If the driver station starts with "Red" make alliance colour red, if it starts with "Blue" make alliance colour blue
                                if (SettingValues.selectedDriverStation.text
                                    .startsWith("Red")) {
                                  PrematchValues.teamAlliance = "Red";
                                } else if (SettingValues
                                    .selectedDriverStation.text
                                    .startsWith("Blue")) {
                                  PrematchValues.teamAlliance = "Blue";
                                }
                              });
                            },
                            dropdownItems:
                                OptionConstants.availableDriverstations),
                      ],
                    ),
                    Column(
                      children: [
                        const TitleStyle(
                            text: "Event ID",
                            padding: EdgeInsets.only(top: 10)),
                        TextInputField(
                            onChanged: (value) {
                              setState(() {
                                SettingValues.eventID.text = value;
                                AppDataHelper
                                    .saveCurrentEventIDAndCurrentDriverStation();
                              });
                            },
                            textAlign: TextAlign.left,
                            hintText: "Event ID",
                            controller: SettingValues.eventID,
                            margin: const EdgeInsets.only(left: 40, top: 10)),
                      ],
                    ),
                    Column(
                      children: [
                        const TitleStyle(
                            text: "File Name",
                            padding: EdgeInsets.only(left: 30, top: 10)),
                        TextInputField(
                          onChanged: (value) {
                            setState(() {
                              SettingValues.fileName.text = value;
                            });
                          },
                          textAlign: TextAlign.left,
                          hintText: "File Name",
                          controller: SettingValues.fileName,
                          margin: const EdgeInsets.only(left: 45, top: 10),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const TitleStyle(
                            text: "QR Code Centerfold",
                            padding: EdgeInsets.only(left: 30, top: 10)),
                        PlatformDropdownMenu(
                            margin: const EdgeInsets.only(top: 10, right: 30),
                            selectedItemFontSize: 10.0,
                            dropdownMenuSelectedItem:
                                SettingValues.currentSelectedCenterfold.text,
                            onChanged: (value) {
                              setState(() {
                                SettingValues.currentSelectedCenterfold.text =
                                    value;
                              });
                            },
                            dropdownItems: OptionConstants.centerfolds),
                      ],
                    ),
                    Column(
                      children: [
                        const TitleStyle(
                            text: "Team Number Editable",
                            padding: EdgeInsets.only(left: 30, top: 10)),
                        PlatformDropdownMenu(
                            width: 150.0,
                            margin: const EdgeInsets.only(top: 10, right: 120),
                            dropdownMenuSelectedItem:
                                SettingValues.isTeamNumberEditable,
                            onChanged: (value) {
                              // When the value is changed then set the is team number editable accordingly
                              setState(() {
                                SettingValues.isTeamNumberEditable = value;
                                if (SettingValues.isTeamNumberEditable ==
                                    "Yes") {
                                  SettingValues.isTeamNumberReadOnly = false;
                                } else {
                                  SettingValues.isTeamNumberReadOnly = true;
                                }
                              });
                            },
                            dropdownItems: OptionConstants.yesNoOptions),
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
