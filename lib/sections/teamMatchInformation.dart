// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

import '../routes/comments.dart';
import '../builders/dropdownMenu.dart';
import '../builders/numberInputField.dart';

class TeamAndMatchData extends StatefulWidget {
  const TeamAndMatchData({
    Key? key,
  }) : super(key: key);

  @override
  _TeamAndMatchDataState createState() => _TeamAndMatchDataState();

  // Team and match info number input fields
  static final TextEditingController initialsController =
      TextEditingController(text: "");
  static final TextEditingController matchNumberController =
      TextEditingController(text: "");
  static final TextEditingController teamNumberController =
      TextEditingController(text: "");

  // Team and match information
  static String teamAlliance = "Red";
  static late String initials;
  static late int matchNumber;
  static late int teamNumber;
}

class _TeamAndMatchDataState extends State<TeamAndMatchData> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> allianceOptions = ['Blue', 'Red'];

    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // "Your initials" input field
              ScoutingDropdownMenu(
                  margin: const EdgeInsets.only(left: 20.0, top: 2.0),
                  width: 130.0,
                  dropdownMenuSelectedItem: TeamAndMatchData.teamAlliance,
                  onChanged: (value) {
                    setState(() {
                      TeamAndMatchData.teamAlliance = value;
                    });
                  },
                  dropdownItems: allianceOptions),

              // "Team number" input field
              NumberInputField(
                controller: TeamAndMatchData.teamNumberController,
                hintText: "Team Number",
              ),

              // "Match number" input field
              NumberInputField(
                controller: TeamAndMatchData.matchNumberController,
                hintText: "Match Number",
              ),
              Container(
                  padding: const EdgeInsets.only(top: 4.0, left: 150.0),
                  height: 47.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyle
                          .textInputColorLight, // Set the background color here
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Comments(title: "Comments");
                      }));
                    },
                    child: const Text(
                      'Comments and QR Code',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )),
              // Container(
              //   padding: EdgeInsets.only(left: 42.0),
              //   child: Transform.scale(
              //     scale: 1.5,
              //     child: Switch(
              //       // thumb color (round icon)
              //       activeColor: Colors.blueGrey.shade400,
              //       activeTrackColor: Colors.red.shade600,
              //       inactiveThumbColor: Colors.blueGrey.shade600,
              //       inactiveTrackColor: Colors.grey.shade400,
              //       splashRadius: 100.0,
              //       // boolean variable value
              //       value: AutoScoutingData.balancedInAuto,
              //       // changes the state of the switch
              //       onChanged: (value) =>
              //           setState(() => AutoScoutingData.balancedInAuto = value),
              //     ),
              //   ),
              // ),
              // // Balanced In Teleop?
              // Container(
              //   padding: EdgeInsets.only(left: 120.0),
              //   child: Transform.scale(
              //     scale: 1.5,
              //     child: Switch(
              //       // thumb color (round icon)
              //       activeColor: Colors.blueGrey.shade400,
              //       activeTrackColor: Colors.red.shade600,
              //       inactiveThumbColor: Colors.blueGrey.shade600,
              //       inactiveTrackColor: Colors.grey.shade400,
              //       splashRadius: 100.0,
              //       // boolean variable value
              //       value: TeleopScoutingData.balancedInTeleop,
              //       // changes the state of the switch
              //       onChanged: (value) => setState(
              //           () => TeleopScoutingData.balancedInTeleop = value),
              //     ),
              //   ),
              // ),
            ]),
      ],
    );
  }
}
