// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/NumberInputField.dart';
import 'package:scouting_platform/builders/bases/TextInputField.dart';
import 'package:scouting_platform/routes/data/DataRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/helpers/AppDataHelper.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class PrematchFields extends StatefulWidget {
  const PrematchFields({
    super.key,
  });

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
    // If all requirements are met to update the team number automatically, update it on page loade
    if (SettingValues.isTeamNumberReadOnly) {
      if (PrematchValues.matchNumber.text != "") {
        // If it isn't null
        Schedulehelper.getTeamNumberFromSchedule(int.parse(
            // Get the team number from the schedule
            PrematchValues.matchNumber.text)).then((teamNumber) {
          // Once retrieved then set the team number to the text field
          setState(() {
            PrematchValues.teamNumber.text = teamNumber.toString();
          });
        });
      }
    }
  }

  /// Increments an integer in a controllers value by one
  void incrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue++;
      controller.text = currentValue.toString();
    });
  }

  /// Decrements an integer in a controllers value by one unless it's 0
  void decrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue--;
      controller.text = (currentValue > 0 ? currentValue : 0).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Initials
        TextInputField(
            controller: PrematchValues.initials,
            margin: const EdgeInsets.only(left: 20),
            onChanged: (value) {},
            textAlign: TextAlign.center,
            hintText: "Scout Initials"),
        NumberInputField(
          margin: const EdgeInsets.only(left: 40),
          onChanged: (value) async {
            if (SettingValues.isTeamNumberReadOnly) {
              if (PrematchValues.matchNumber.text != "") {
                // If it isn't null
                Schedulehelper.getTeamNumberFromSchedule(int.parse(
                    // Get the team number from the schedule
                    PrematchValues.matchNumber.text)).then((teamNumber) {
                  // Once retrieved then set the team number to the text field
                  setState(() {
                    PrematchValues.teamNumber.text = teamNumber.toString();
                  });
                });
              }
            }
          },
          controller: PrematchValues.matchNumber,
          hintText: "Match Number",
        ),
        // team number
        NumberInputField(
          margin: const EdgeInsets.only(left: 40),
          readOnly: SettingValues.isTeamNumberReadOnly,
          onChanged: (value) {},
          controller: PrematchValues.teamNumber,
          hintText: "Team Number",
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
                padding:
                    const EdgeInsets.only(top: 4.0, right: 13, left: 100.0),
                height: 47.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyle
                        .textInputColor, // Set the background color here
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const DataRoute(title: "Data Input");
                    }));
                  },
                  child: const Text("Auto/Teleop >",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Helvetica",
                          color: Colors.white)),
                )))
      ],
    );
  }
}
