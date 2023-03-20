// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../builders/numberFieldWithCounter.dart';

class TeleopScoutingData extends StatefulWidget {
  const TeleopScoutingData({
    Key? key,
  }) : super(key: key);

  @override
  _TeleopScoutingDataState createState() => _TeleopScoutingDataState();

  static final TextEditingController teleopConeLowController =
      TextEditingController(text: "0");
  static final TextEditingController teleopConeMidController =
      TextEditingController(text: "0");
  static final TextEditingController teleopConeHighController =
      TextEditingController(text: "0");
  static final TextEditingController teleopConeMissedController =
      TextEditingController(text: "0");
  static final TextEditingController teleopConeDroppedController =
      TextEditingController(text: "0");

  static final TextEditingController teleopCubeLowController =
      TextEditingController(text: "0");
  static final TextEditingController teleopCubeMidController =
      TextEditingController(text: "0");
  static final TextEditingController teleopCubeHighController =
      TextEditingController(text: "0");
  static final TextEditingController teleopCubeMissedController =
      TextEditingController(text: "0");
  static final TextEditingController teleopCubeDroppedController =
      TextEditingController(text: "0");

  static final TextEditingController teleopBalanceTimeController =
      TextEditingController(text: "");
  static final TextEditingController autoBalanceTimeController =
      TextEditingController(text: "");

  // Teleop balancing data
  static String teleopBalance = "No Attempt";

  static String teleopMobility = "No";
}

class _TeleopScoutingDataState extends State<TeleopScoutingData> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 190,
                  padding: const EdgeInsets.only(top: 7.0, left: 20.0),
                  child: const Text(
                    "Cones Low",
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
                  width: 172,
                  padding: const EdgeInsets.only(top: 7.0),
                  child: const Text(
                    "Cones Mid",
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
                  padding: const EdgeInsets.only(top: 7.0),
                  child: const Text(
                    "Cones High",
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
                  width: 200,
                  padding: const EdgeInsets.only(top: 7.0, left: 20.0),
                  child: const Text(
                    "Cones Missed",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Container(
              //     width: 200,
              //     padding: const EdgeInsets.only(top: 7.0, left: 10.0),
              //     child: const Text(
              //       "Time To Balance In Auto",
              //       textAlign: TextAlign.left,
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 15.0),
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Container(
              //     width: 200,
              //     padding: const EdgeInsets.only(top: 7.0, left: 7.0),
              //     child: const Text(
              //       "Balanced In Teleop?",
              //       textAlign: TextAlign.left,
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 15.0),
              //     ),
              //   ),
              // ),
            ]),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Teleop Scored Cone Low
            NumberInputFieldWithCounter(
              controller: TeleopScoutingData.teleopConeLowController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopConeLowController.text);
                setState(() {
                  currentValue++;
                  TeleopScoutingData.teleopConeLowController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopConeLowController.text);
                setState(() {
                  currentValue--;
                  TeleopScoutingData.teleopConeLowController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Teleop Scored Cone Mid
            NumberInputFieldWithCounter(
              controller: TeleopScoutingData.teleopConeMidController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopConeMidController.text);
                setState(() {
                  currentValue++;
                  TeleopScoutingData.teleopConeMidController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopConeMidController.text);
                setState(() {
                  currentValue--;
                  TeleopScoutingData.teleopConeMidController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Teleop Scored Cone High
            NumberInputFieldWithCounter(
              controller: TeleopScoutingData.teleopConeHighController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopConeHighController.text);
                setState(() {
                  currentValue++;
                  TeleopScoutingData.teleopConeHighController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopConeHighController.text);
                setState(() {
                  currentValue--;
                  TeleopScoutingData.teleopConeHighController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Teleop Cone Missed
            NumberInputFieldWithCounter(
              controller: TeleopScoutingData.teleopConeMissedController,
              onTapIncrement: () {
                int currentValue = int.parse(
                    TeleopScoutingData.teleopConeMissedController.text);
                setState(() {
                  currentValue++;
                  TeleopScoutingData.teleopConeMissedController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue = int.parse(
                    TeleopScoutingData.teleopConeMissedController.text);
                setState(() {
                  currentValue--;
                  TeleopScoutingData.teleopConeMissedController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),
          ],
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 133,
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: const Text(
                "Cubes Low",
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
              width: 170,
              padding: const EdgeInsets.only(top: 10.0, left: 58.0),
              child: const Text(
                "Cubes Mid",
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
              width: 170,
              padding: const EdgeInsets.only(top: 10.0, left: 58.0),
              child: const Text(
                "Cubes High",
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
              padding: const EdgeInsets.only(top: 10.0, left: 57.0),
              child: const Text(
                "Cubes Missed",
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
              width: 180,
              padding: const EdgeInsets.only(top: 10.0),
              child: const Text(
                "Time To Balance In Teleop",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            ),
          ),
        ]),
        Row(
          children: [
            // Teleop Cube Low
            NumberInputFieldWithCounter(
              controller: TeleopScoutingData.teleopCubeLowController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopCubeLowController.text);
                setState(() {
                  currentValue++;
                  TeleopScoutingData.teleopCubeLowController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopCubeLowController.text);
                setState(() {
                  currentValue--;
                  TeleopScoutingData.teleopCubeLowController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Teleop Cube Mid
            NumberInputFieldWithCounter(
              controller: TeleopScoutingData.teleopCubeMidController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopCubeMidController.text);
                setState(() {
                  currentValue++;
                  TeleopScoutingData.teleopCubeMidController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopCubeMidController.text);
                setState(() {
                  currentValue--;
                  TeleopScoutingData.teleopCubeMidController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Teleop Cube High
            NumberInputFieldWithCounter(
              controller: TeleopScoutingData.teleopCubeHighController,
              onTapIncrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopCubeHighController.text);
                setState(() {
                  currentValue++;
                  TeleopScoutingData.teleopCubeHighController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue =
                    int.parse(TeleopScoutingData.teleopCubeHighController.text);
                setState(() {
                  currentValue--;
                  TeleopScoutingData.teleopCubeHighController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),

            // Teleop Cube Missed
            NumberInputFieldWithCounter(
              controller: TeleopScoutingData.teleopCubeMissedController,
              onTapIncrement: () {
                int currentValue = int.parse(
                    TeleopScoutingData.teleopCubeMissedController.text);
                setState(() {
                  currentValue++;
                  TeleopScoutingData.teleopCubeMissedController.text =
                      (currentValue > 0 ? currentValue : 0).toString();
                });
              },
              onTapDecrement: () {
                int currentValue = int.parse(
                    TeleopScoutingData.teleopCubeMissedController.text);
                setState(() {
                  currentValue--;
                  TeleopScoutingData.teleopCubeMissedController.text =
                      (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                });
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 40.0),
            //   child: SizedBox(
            //     height: 47,
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           backgroundColor: AppStyle.textInputColor),
            //       onPressed: toggleTeleopBalanceStopwatch,
            //       child: Text(
            //         TeleopScoutingData.teleopBalanceIsRunning
            //             ? "Stopped Balancing ${formatTime(TeleopScoutingData.teleopBalanceElapsedSeconds)}"
            //             : "Started Balancing ${formatTime(TeleopScoutingData.teleopBalanceElapsedSeconds)}",
            //         style: const TextStyle(fontSize: 16.0),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  // void toggleTeleopBalanceStopwatch() {
  //   setState(() {
  //     if (TeleopScoutingData.teleopBalanceIsRunning) {
  //       TeleopScoutingData.teleopBalanceTimer.cancel();
  //       TeleopScoutingData.teleopBalanceIsRunning = false;
  //     } else {
  //       TeleopScoutingData.teleopBalanceTimer =
  //           Timer.periodic(const Duration(seconds: 1), (Timer timer) {
  //         setState(() {
  //           TeleopScoutingData.teleopBalanceElapsedSeconds++;
  //         });
  //       });
  //       TeleopScoutingData.teleopBalanceIsRunning = true;
  //     }
  //   });
  // }

  // void toggleAutoBalanceStopwatch() {
  //   setState(() {
  //     if (TeleopScoutingData.autoBalanceIsRunning) {
  //       TeleopScoutingData.autoBalanceTimer.cancel();
  //       TeleopScoutingData.autoBalanceIsRunning = false;
  //     } else {
  //       TeleopScoutingData.autoBalanceTimer =
  //           Timer.periodic(const Duration(seconds: 1), (Timer timer) {
  //         setState(() {
  //           TeleopScoutingData.autoBalanceElapsedSeconds++;
  //         });
  //       });
  //       TeleopScoutingData.autoBalanceIsRunning = true;
  //     }
  //   });
  // }

  static String formatTime(int seconds) {
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${minutes.toString()}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}
