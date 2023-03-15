import 'package:scouting_platform/routes/comments.dart';
import 'package:scouting_platform/routes/splashpage.dart';
import 'package:scouting_platform/text/title.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scouting_platform/routes/nav/navigationSidebar.dart';
import 'package:scouting_platform/sections/autoScoutingData.dart';
import 'package:scouting_platform/sections/teamMatchInformation.dart';
import 'package:scouting_platform/sections/teleopScoutingData.dart';
import 'package:scouting_platform/text/header.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/dropdownMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Scouting Platform",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static MobileScannerController cameraController = MobileScannerController();

  // Additional
  static late String comments = "";
}

class _HomeScreenState extends State<HomeScreen> {
  // Dropdown menu options
  final List<String> yesNoOptions = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          // Navigation sidebar
          drawer: const NavigationSidebar(),
          // Background color and pixel resize fix
          backgroundColor: AppStyle.primaryColor,

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
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(children: const [
                  TitleStyle(
                      text: "Team & Match Information",
                      padding: EdgeInsets.only(left: 18.0)),
                ]),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 170.0,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      "Team Alliance",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),

                // Creates team adn match data fields section
                const TeamAndMatchData(),

                /**
           * Scouting data title.
           */
                Row(children: [
                  const TitleStyle(
                      text: "Scouting Data",
                      padding: EdgeInsets.only(top: 10.0, left: 18.0)),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 170.0,
                      padding: const EdgeInsets.only(top: 25.0),
                      child: const Text(
                        "Auto Mobility",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 170.0,
                      padding: const EdgeInsets.only(top: 25.0),
                      child: const Text(
                        "Auto Balance",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 260.0,
                      padding: const EdgeInsets.only(top: 25.0),
                      child: const Text(
                        "Teleop Balance",
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
                  // Auto text header.
                  const HeaderStyle(
                      text: "Auto",
                      padding: EdgeInsets.only(top: 0.0, left: 18.0)),
                  Container(
                    padding: EdgeInsets.only(left: 290),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Switch(
                        // thumb color (round icon)
                        activeColor: Colors.blueGrey.shade400,
                        activeTrackColor: Colors.red.shade600,
                        inactiveThumbColor: Colors.blueGrey.shade600,
                        inactiveTrackColor: Colors.grey.shade400,
                        splashRadius: 100.0,
                        // boolean variable value
                        value: AutoScoutingData.autoMobility,
                        // changes the state of the switch
                        onChanged: (value) => setState(
                            () => AutoScoutingData.autoMobility = value),
                      ),
                    ),
                  ),
                  ScoutingDropdownMenu(
                      margin: const EdgeInsets.only(left: 112.0),
                      width: 130,
                      dropdownMenuSelectedItem: AutoScoutingData.autoBalance,
                      onChanged: (value) => {
                            setState(() {
                              AutoScoutingData.autoBalance = value;
                            })
                          },
                      dropdownItems: AutoScoutingData.balanceOptions),
                  ScoutingDropdownMenu(
                      margin: const EdgeInsets.only(left: 40.0),
                      width: 130,
                      dropdownMenuSelectedItem:
                          TeleopScoutingData.teleopBalance,
                      onChanged: (value) => {
                            setState(() {
                              TeleopScoutingData.teleopBalance = value;
                            })
                          },
                      dropdownItems: AutoScoutingData.balanceOptions)
                ]),

                const AutoScoutingData(),

                /**
           * Teleop data header.
           */
                const HeaderStyle(
                    text: "Teleop",
                    padding: EdgeInsets.only(left: 18.0, top: 10.0)),

                const TeleopScoutingData(),
              ],
            ),
          ),
        ));
  }
}
