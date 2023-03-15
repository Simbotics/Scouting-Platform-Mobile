import 'dart:async';

import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/dropdownMenu.dart';
import '../utils/numberFieldWithCounter.dart';

class AutoScoutingData extends StatefulWidget {
  const AutoScoutingData({
    Key? key,
  }) : super(key: key);

  @override
  _AutoScoutingDataState createState() => _AutoScoutingDataState();

  // Auto scoring number input fields
  static final TextEditingController autoLowController =
      TextEditingController(text: "0");
  static final TextEditingController autoMidController =
      TextEditingController(text: "0");
  static final TextEditingController autoHighController =
      TextEditingController(text: "0");
  static final TextEditingController autoMissedController =
      TextEditingController(text: "0");
  static final TextEditingController autoDroppedController =
      TextEditingController(text: "0");

  static final TextEditingController teleopBalanceTime =
      TextEditingController(text: "0");
  static final TextEditingController autoBalanceTime =
      TextEditingController(text: "0");

  /**
   * AUTO
   */

  // Auto scouting data
  static int autoScoredLow = int.parse(AutoScoutingData.autoLowController.text);
  static late int autoScoredMid;
  static late int autoScoredHigh;
  static late int autoScoredMissed;

  // Auto balancing data
  static String autoBalance = "No Attempt";

  static bool autoMobility = false;

  static List<String> balanceOptions = ['Attempted', 'No Attempt', 'Succeeded'];
}

class _AutoScoutingDataState extends State<AutoScoutingData> {
  @override
  void initState() {
    super.initState();
    AutoScoutingData.autoScoredMid =
        int.parse(AutoScoutingData.autoMidController.text);
    AutoScoutingData.autoScoredHigh =
        int.parse(AutoScoutingData.autoHighController.text);
    AutoScoutingData.autoScoredMissed =
        int.parse(AutoScoutingData.autoMissedController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.only(top: 7.0, left: 20.0),
                  child: const Text(
                    "Low",
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
                  width: 150,
                  padding: const EdgeInsets.only(top: 7.0, left: 42.0),
                  child: const Text(
                    "Middle",
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
                  width: 150,
                  padding: const EdgeInsets.only(top: 7.0, left: 61.0),
                  child: const Text(
                    "High",
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
                  width: 250,
                  padding: const EdgeInsets.only(top: 7.0, left: 80.0),
                  child: const Text(
                    "Missed",
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
                  width: 250,
                  padding: const EdgeInsets.only(top: 7.0),
                  child: const Text(
                    "Dropped",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
              ),
            ]),

        /**
       * Input fields for auto scouting data.
       */
        Row(
          children: [
            // Auto Scored Low
            NumberInputFieldWithCounter(
              controller: AutoScoutingData.autoLowController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoLowController.text);
                setState(() {
                  currentValue++;
                  AutoScoutingData.autoLowController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoLowController.text);
                setState(() {
                  currentValue--;
                  AutoScoutingData.autoLowController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Auto Scored Mid
            NumberInputFieldWithCounter(
              controller: AutoScoutingData.autoMidController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoMidController.text);
                setState(() {
                  currentValue++;
                  AutoScoutingData.autoMidController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoMidController.text);
                setState(() {
                  currentValue--;
                  AutoScoutingData.autoMidController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Auto Scored High
            NumberInputFieldWithCounter(
              controller: AutoScoutingData.autoHighController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoHighController.text);
                setState(() {
                  currentValue++;
                  AutoScoutingData.autoHighController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoHighController.text);
                setState(() {
                  currentValue--;
                  AutoScoutingData.autoHighController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Auto Scored Missed
            NumberInputFieldWithCounter(
              controller: AutoScoutingData.autoMissedController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoMissedController.text);
                setState(() {
                  currentValue++;
                  AutoScoutingData.autoMissedController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoMissedController.text);
                setState(() {
                  currentValue--;
                  AutoScoutingData.autoMissedController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Auto Dropped
            NumberInputFieldWithCounter(
              controller: AutoScoutingData.autoDroppedController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoDroppedController.text);
                setState(() {
                  currentValue++;
                  AutoScoutingData.autoDroppedController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(AutoScoutingData.autoDroppedController.text);
                setState(() {
                  currentValue--;
                  AutoScoutingData.autoDroppedController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
