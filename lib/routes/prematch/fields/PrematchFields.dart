// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/fields/FieldRegistry.dart';
import 'package:scouting_platform/utils/fields/FieldRow.dart';
import 'package:scouting_platform/utils/helpers/AppDataHelper.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class PrematchFields extends StatefulWidget {
  const PrematchFields({super.key});

  @override
  State<PrematchFields> createState() => _PrematchFieldsState();
}

class _PrematchFieldsState extends State<PrematchFields> {
  @override
  void initState() {
    super.initState();
    AppDataHelper.getCurrentEventIDAndCurrentDriverStation()
        .then((value) => setState(() {
              if (value != "") {
                List<String> lineArray = value.split(",");
                SettingValues.eventID.text = lineArray[0];
                SettingValues.selectedDriverStation.text = lineArray[1];
                switch (lineArray[1]) {
                  case "Red 1":
                    Schedulehelper.argumentReadingIndex = 1;
                    break;
                  case "Red 2":
                    Schedulehelper.argumentReadingIndex = 2;
                    break;
                  case "Red 3":
                    Schedulehelper.argumentReadingIndex = 3;
                    break;
                  case "Blue 1":
                    Schedulehelper.argumentReadingIndex = 4;
                    break;
                  case "Blue 2":
                    Schedulehelper.argumentReadingIndex = 5;
                    break;
                  case "Blue 3":
                    Schedulehelper.argumentReadingIndex = 6;
                    break;
                }
              }
            }));

    // Ensure match number is set before trying to fetch team number
    if (SettingValues.isTeamNumberReadOnly) {
      if (PrematchValues.matchNumber.text != "") {
        _updateTeamNumber(); // Call helper function to update team number
      }
    }
  }

  void _updateTeamNumber() async {
    int matchNumber;
    try {
      matchNumber = int.parse(PrematchValues.matchNumber.text);
    } catch (e) {
      // Handle invalid match number case
      return;
    }

    // Get the team number from the schedule
    String teamNumber =
        (await Schedulehelper.getTeamNumberFromSchedule(matchNumber)) as String;
    String robotCapacity = (await Schedulehelper.findRobotCapacity(teamNumber));

    if (mounted) {
      setState(() {
        PrematchValues.teamNumber.text = teamNumber;
        PrematchValues.hopperCapacity.text = robotCapacity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FieldRow.fields([
      FieldRegistry.prematchInitials,
      FieldRegistry.prematchMatchNumber,
      FieldRegistry.prematchTeamNumber,
    ]);
  }
}
