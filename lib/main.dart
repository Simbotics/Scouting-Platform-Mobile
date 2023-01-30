import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_platform/routes/nav/navigationSidebar.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/dropdownMenu.dart';
import 'package:scouting_platform/utils/numberFieldWithCounter.dart';
import 'package:scouting_platform/utils/textInputField.dart';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  // Number input field controllers
  static TextEditingController _controller = TextEditingController(text: "0");

  // Team and match information
  static late String initials = "";
  static late String matchNumber = "";
  static late String teamNumber = "";
  static late String matchType = "Match Type";
}

class _HomeScreenState extends State<HomeScreen> {
  // Dropdown menu options
  final List<String> matchTypes = [
    'Match Type',
    'Practice',
    'Qualifications',
    'Quarterfinals',
    'Semifinals',
    'Finals'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navigation sidebar
      drawer: NavigationSidebar(),
      // Background color and pixel resize fix
      backgroundColor: AppStyle.primaryColor,
      resizeToAvoidBottomInset: false,

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

      // Body (input fields)
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 28.0)),
          // Center(
          //   // Generate QR code image
          //   child: QrImage(
          //     data: "$initials $teamNumber $matchNumber $matchType" +
          //         _controller.text,
          //     backgroundColor: Colors.white,
          //     version: QrVersions.auto,
          //     size: 300.0,
          //   ),
          // ),
          const SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 18.0),
            child: const Text(
              "Team & Match Information",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30.0),
            ),
          ),

          /**
           * Team, Scouter, and Match information (row one)
           */

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // "Your initials" input field
                TextInputField(
                    margin: const EdgeInsets.only(top: 24.0),
                    onChanged: (value) {
                      setState(() {
                        HomeScreen.initials = value;
                      });
                    },
                    textAlign: TextAlign.center,
                    hintText: "Your Initials"),

                // "Team number" input field
                TextInputField(
                    margin: const EdgeInsets.only(top: 24.0),
                    onChanged: (value) {
                      setState(() {
                        HomeScreen.teamNumber = value;
                      });
                    },
                    textAlign: TextAlign.center,
                    hintText: "Team Number"),

                // "Match type" dropdown menu
                DropdownMenu(
                    margin: const EdgeInsets.only(top: 24.0),
                    dropdownMenuSelectedItem: HomeScreen.matchType,
                    onChanged: (value) {
                      setState(() {
                        HomeScreen.matchType = value;
                      });
                    },
                    dropdownItems: matchTypes),

                // "Match number" input field
                TextInputField(
                    margin: const EdgeInsets.only(top: 24.0),
                    onChanged: (value) {
                      setState(() {
                        HomeScreen.matchNumber = value;
                      });
                    },
                    textAlign: TextAlign.center,
                    hintText: "Match Number"),
              ]),

          /**
           * Scouting data
           */

          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 48.0, left: 18.0),
            child: const Text(
              "Scouting Data",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 300,
              padding: const EdgeInsets.only(top: 12.0, left: 15.0),
              child: const Text(
                "Scored On Bottom",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Number input field creation
              NumberInputFieldWithCounter(
                controller: HomeScreen._controller,
                onTapIncrement: () {
                  int currentValue = int.parse(HomeScreen._controller.text);
                  setState(() {
                    currentValue++;
                    HomeScreen._controller.text =
                        (currentValue > 0 ? currentValue : 0).toString();
                  });
                },
                onTapDecrement: () {
                  int currentValue = int.parse(HomeScreen._controller.text);
                  setState(() {
                    currentValue--;
                    HomeScreen._controller.text =
                        (currentValue > 0 ? currentValue : 0)
                            .toString(); // decrementing value
                  });
                },
              ),
              // "Team number" input field
              TextInputField(
                  //margin: const EdgeInsets.only(top: 24.0),
                  onChanged: (value) {
                    setState(() {
                      HomeScreen.teamNumber = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  hintText: "Test 1"),

              TextInputField(
                  //margin: const EdgeInsets.only(top: 24.0),
                  onChanged: (value) {
                    setState(() {
                      HomeScreen.teamNumber = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  hintText: "Test 2"),

              // "Match number" input field
              TextInputField(
                  //margin: const EdgeInsets.only(top: 24.0),
                  onChanged: (value) {
                    setState(() {
                      HomeScreen.matchNumber = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  hintText: "Test 3"),
            ],
          ),
        ],
      ),
    );
  }
}
