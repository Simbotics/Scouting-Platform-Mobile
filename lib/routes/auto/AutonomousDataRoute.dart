// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousLeftRow1.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousLeftRow2.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousLeftRow3.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousRightRowNumberPad.dart';
import 'package:scouting_platform/routes/auto/labels/AutonomousLeftLabels/AutonomousLeftLabel1.dart';
import 'package:scouting_platform/routes/auto/labels/AutonomousLeftLabels/AutonomousLeftLabel2.dart';
import 'package:scouting_platform/routes/auto/labels/AutonomousLeftLabels/AutonomousLeftLabel3.dart';
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
import 'package:scouting_platform/routes/teleop/TeleopRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

class AutonomousDataRoute extends StatefulWidget {
  const AutonomousDataRoute({super.key, required this.title});
  final String title;

  @override
  State<AutonomousDataRoute> createState() => _DataRouteState();
}

class _DataRouteState extends State<AutonomousDataRoute> {
  @override
  void initState() {
    super.initState();
    UIHelper.setBrightness(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformRoute(
      title: widget.title,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // various right side data entry and labels
                    const AutonomousLeftLabel1(),
                    const AutonomousLeftRow1(),
                    const AutonomousLeftLabel2(),
                    const AutonomousLeftRow2(),
                    const AutonomousLeftLabel3(),
                    const AutonomousLeftRow3(),
                  ],
                ),
              ),

              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // reset button
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(150.0, 37.0),
                              backgroundColor: AppStyle.textInputColor,
                              padding: const EdgeInsets.all(15),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const PrematchRoute(title: "Prematch");
                              }));
                            },
                            child: const Text(
                              "< Prematch",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: "Helvetica",
                                color: Colors.white,
                              ),
                            )),
                      ),

                      const SizedBox(width: 10.0),

                      // next page button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150.0, 37.0),
                          backgroundColor: AppStyle.textInputColor,
                          padding: const EdgeInsets.all(15),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const TeleopRoute(title: "Teleop");
                          }));
                        },
                        child: const Text(
                          "Teleop >",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Helvetica",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  AutonomousRightrowNumberPad(),

                  SizedBox(
                    height: 20,
                  ),

                  // robot information
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 400.0,
                        padding: const EdgeInsets.only(top: 0.0, right: 0.0),
                        margin: EdgeInsets.only(left: 90.0, top: 55.0),
                        child: Text(
                          "Driver Station: ${SettingValues.selectedDriverStation.text}, Match #${PrematchValues.matchNumber.text}, Team #${PrematchValues.teamNumber.text}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                      )),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
