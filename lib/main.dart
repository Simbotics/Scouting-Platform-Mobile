import 'package:flutter/services.dart';
import 'package:scouting_platform/routes/comments.dart';
import 'package:scouting_platform/routes/teamAndMatchInformation.dart';
import 'package:scouting_platform/rows/fields/row1fields.dart';
import 'package:scouting_platform/rows/fields/row2fields.dart';
import 'package:scouting_platform/rows/fields/row3fields.dart';
import 'package:scouting_platform/rows/fields/row4fields.dart';
import 'package:scouting_platform/rows/headers/row1headers.dart';
import 'package:scouting_platform/rows/headers/row2headers.dart';
import 'package:scouting_platform/rows/headers/row3headers.dart';
import 'package:scouting_platform/rows/headers/row4headers.dart';
import 'package:scouting_platform/sections/comments.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scouting_platform/routes/nav/navigationSidebar.dart';
import 'package:scouting_platform/sections/autoScoutingData.dart';
import 'package:scouting_platform/sections/teamMatchInformation.dart';
import 'package:scouting_platform/sections/teleopScoutingData.dart';
import 'package:scouting_platform/ui/style/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Scouting Platform",
      debugShowCheckedModeBanner: false,
      home: TeamAndMatchInformation(),
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
    return Scaffold(
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
        // Create a scrollable widget so that the page is scrollable when using the keyboard
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, right: 90.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Create text that contains team alliance, team number, and match number
                  Center(
                      child: Text(
                    "${TeamAndMatchData.teamAlliance} - ${TeamAndMatchData.teamNumberController.text} - Q${TeamAndMatchData.matchNumberController.text}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                  // Button to reset all field data
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          padding: const EdgeInsets.only(left: 13),
                          height: 30.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppStyle.textInputColorLight,
                            ),
                            onPressed: () {
                              showConformationDialog(context);
                            },
                            child: const Text(
                              'Reset All Fields',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ))),
                ],
              ),
            ),

            // Create titles for auto and teleop
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                TitleStyle(text: "Auto", padding: EdgeInsets.only(left: 20)),
                SizedBox(width: 0),
                TitleStyle(text: "Teleop", padding: EdgeInsets.only(left: 320))
              ],
            ),

            // Create rows of fields and headers for those fields
            const Row1Headers(),
            const Row1Fields(),
            const Row2Headers(),
            const Row2Fields(),
            const Row3Headers(),
            const Row3Fields(),
            const Row4Headers(),
            const Row4Fields(),
            const SizedBox(height: 20),
            Row(
              children: [
                // Prematch button
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding: const EdgeInsets.only(top: 4.0, left: 13),
                        height: 47.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyle
                                .textInputColorLight, // Set the background color here
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const TeamAndMatchInformation();
                            }));
                          },
                          child: const Text(
                            '< Prematch ',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ))),
                const Spacer(),
                // Comments button
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
                              return const Comments(title: "Comments");
                            }));
                          },
                          child: const Text(
                            'Comments >',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )))
              ],
            )
          ]),
        ));
  }

  /// Resets all fields that the user has put information into
  void resetAllFields() {
    setState(() {
      CommentsSection.qrIsVisible = false;
      TeamAndMatchData.initials = "";
      TeamAndMatchData.initialsController.text = "";
      TeamAndMatchData.matchNumber = 0;
      TeamAndMatchData.matchNumberController.text = "";
      TeamAndMatchData.teamAlliance = "Red";
      TeamAndMatchData.teamNumber = 0;
      TeamAndMatchData.teamNumberController.text = "";
      TeamAndMatchData.initials = "";
      TeamAndMatchData.initialsController.text = "";

      AutoScoutingData.autoMobility = "No";
      AutoScoutingData.autoBalance = "No Attempt";

      AutoScoutingData.autoHighController.text = "0";
      TeleopScoutingData.teleopConeHighController.text = "0";
      TeleopScoutingData.teleopCubeHighController.text = "0";
      TeleopScoutingData.teleopBalance = "No Attempt";

      AutoScoutingData.autoBalance = "No Attempt";
      AutoScoutingData.autoMidController.text = "0";
      TeleopScoutingData.teleopConeMidController.text = "0";
      TeleopScoutingData.teleopCubeMidController.text = "0";

      TeleopScoutingData.teleopBalanceTimeController.text = "";
      TeleopScoutingData.autoBalanceTimeController.text = "";

      AutoScoutingData.autoLowController.text = "0";
      TeleopScoutingData.teleopConeLowController.text = "0";
      TeleopScoutingData.teleopCubeLowController.text = "0";
      TeleopScoutingData.teleopCubeDroppedController.text = "0";

      AutoScoutingData.autoMissedController.text = "0";
      TeleopScoutingData.teleopConeMissedController.text = "0";
      TeleopScoutingData.teleopCubeMissedController.text = "0";
      TeleopScoutingData.teleopConeDroppedController.text = "0";

      CommentsSection.autoCommentsController.text = "";
      CommentsSection.preferenceCommentsController.text = "";
      CommentsSection.otherCommentsController.text = "";
    });
  }

  /// Shows alert dialog for resetting all fields
  showConformationDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        resetAllFields();
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const TeamAndMatchInformation();
        }));
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Reset All Fields"),
      content: const Text(
          "Would you like to reset all of the fields to their default values?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
