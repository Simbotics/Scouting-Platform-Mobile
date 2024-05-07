// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/fields/numberInputField.dart';
import 'package:scouting_platform/builders/fields/textInputField.dart';
import 'package:scouting_platform/routes/landing/inputRoute.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/data.dart';

class teamAndMatchInfoFields extends StatefulWidget {
  const teamAndMatchInfoFields({
    Key? key,
  }) : super(key: key);

  @override
  _teamAndMatchInfoFieldsState createState() => _teamAndMatchInfoFieldsState();
}

class _teamAndMatchInfoFieldsState extends State<teamAndMatchInfoFields> {
      @override
  void initState() {
    super.initState();
    Data.getCurrentEventIDAndCurrentDriverStation()
        .then((value) => setState(() {
              List<String> lineArray = value.split(",");
              Data.eventID.text = lineArray[0];
              Data.driverStation = lineArray[1];
              Data.selectedDriverStation.text = lineArray[1];
              switch(lineArray[1]) {
                case "Red 1":
                  Data.argumentReadingIndex = 1;
                  break;
                case "Red 2":
                  Data.argumentReadingIndex = 2;
                  break;
                case "Red 3":
                  Data.argumentReadingIndex = 3;
                  break;
                case "Blue 1":
                  Data.argumentReadingIndex = 4;
                  break;
                case "Blue 2":
                  Data.argumentReadingIndex = 5;
                  break;
                case "Blue 3":
                  Data.argumentReadingIndex = 6;
                  break;
              }
            }));
    // If all requirements are met to update the team number automatically, update it on page loade
    if (Data.isTeamNumberReadOnly) {
      if (Data.matchNumber.text != "") {
        // If it isn't null
        Data.getTeamNumberFromSchedule(int.parse(
            // Get the team number from the schedule
            Data.matchNumber.text)).then((teamNumber) {
          // Once retrieved then set the team number to the text field
          setState(() {
            Data.teamNumber.text = teamNumber.toString();
          });
        });
      }
    }
  }

  /**
   * Increments an integer in a controllers value by one
   */
  void incrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue++;
      controller.text = currentValue.toString();
    });
  }

  /**
   * Decrements an integer in a controllers value by one unless it's 0
   */
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
            controller: Data.initials,
            margin: const EdgeInsets.only(left: 20),
            onChanged: (value) {},
            textAlign: TextAlign.center,
            hintText: "Scout Initials"),
        NumberInputField(
          margin: const EdgeInsets.only(left: 40),
          onChanged: (value) async {
            if (Data.isTeamNumberReadOnly) {
              if (Data.matchNumber.text != "") {
                // If it isn't null
                Data.getTeamNumberFromSchedule(int.parse(
                    // Get the team number from the schedule
                    Data.matchNumber.text)).then((teamNumber) {
                  // Once retrieved then set the team number to the text field
                  setState(() {
                    Data.teamNumber.text = teamNumber.toString();
                  });
                });
              }
            }
          },
          controller: Data.matchNumber,
          hintText: "Match Number",
        ),
        // team number
        NumberInputField(
          margin: const EdgeInsets.only(left: 40),
          readOnly: Data.isTeamNumberReadOnly,
          onChanged: (value) {},
          controller: Data.teamNumber,
          hintText: "Team Number",
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
                padding: const EdgeInsets.only(top: 4.0, right: 13, left: 100.0),
                height: 47.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyle
                        .textInputColor, // Set the background color here
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const InputRoute(title: "Data Input");
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
