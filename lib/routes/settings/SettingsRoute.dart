// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/builders/bases/TextInputField.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/styles/components/HeaderStyle.dart';
import 'package:scouting_platform/utils/helpers/AppDataHelper.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

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
        .then((value) {
      if (!mounted) return;

      setState(() {
        if (value != "") {
          // Once retrieved then set the text fields to the values
          List<String> lineArray = value.split(",");
          SettingValues.eventID.text = lineArray[0];
          SettingValues.selectedDriverStation.text = lineArray[1];
        }
      });
    });

    UIHelper.setBrightness(0.3);
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeaderStyle(
                            text: "Driver Station",
                            padding: EdgeInsets.only(top: 10)),
                        PlatformDropdownMenu(
                            margin: const EdgeInsets.only(top: 10),
                            dropdownMenuSelectedItem:
                                SettingValues.selectedDriverStation.text,
                            onChanged: (value) async {
                              setState(() {
                                SettingValues.selectedDriverStation.text =
                                    value;

                                // If the driver station starts with "Red" make alliance colour red, if it starts with "Blue" make alliance colour blue
                                if (value.startsWith("Red")) {
                                  PrematchValues.teamAlliance = "Red";
                                } else if (value.startsWith("Blue")) {
                                  PrematchValues.teamAlliance = "Blue";
                                }
                              });

                              // Save settings before loading the team and capacity.
                              await AppDataHelper
                                  .saveCurrentEventIDAndCurrentDriverStation();
                              if (!mounted) return;

                              if (!SettingValues.isTeamNumberReadOnly) return;

                              final matchNumber =
                                  int.tryParse(PrematchValues.matchNumber.text);
                              if (matchNumber == null) return;

                              final result = await Schedulehelper
                                  .getTeamNumberFromSchedule(matchNumber);
                              if (!mounted) return;

                              final teamNumber = result?.toString() ?? '';
                              final capacity = result == null
                                  ? ''
                                  : await Schedulehelper.findRobotCapacity(
                                      teamNumber);
                              if (!mounted) return;

                              setState(() {
                                PrematchValues.teamNumber.text = teamNumber;
                                PrematchValues.hopperCapacity.text = capacity;
                              });
                            },
                            dropdownItems:
                                OptionConstants.availableDriverstations),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeaderStyle(
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
                            margin: const EdgeInsets.only(top: 10)),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeaderStyle(
                            text: "Team Number Editable",
                            padding: EdgeInsets.only(top: 10)),
                        PlatformDropdownMenu(
                            width: 150.0,
                            margin: const EdgeInsets.only(top: 10),
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
                ),
              ],
            )));
  }
}
