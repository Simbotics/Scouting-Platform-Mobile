// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
import 'package:scouting_platform/routes/teleop/TeleopRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
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

  Widget _labeledField(String label, Widget child) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 12, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget _dropdown(TextEditingController controller, List<String> options) {
    return PlatformDropdownMenu(
      margin: EdgeInsets.zero,
      dropdownMenuSelectedItem: controller.text,
      dropdownItems: options,
      onChanged: (String? value) {
        if (value == null) return;
        setState(() {
          controller.text = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformRoute(
      title: widget.title,
      body: Padding(
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
                  Row(children: [
                    _labeledField(
                        'Start Position',
                        _dropdown(AutonomousValues.autoStartPosition,
                            OptionConstants.startPositions)),
                  ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    _labeledField(
                        'General Path',
                        _dropdown(AutonomousValues.autoPath,
                            OptionConstants.autoPath)),
                    _labeledField(
                        'Depth Into Pile',
                        _dropdown(AutonomousValues.autoSweep,
                            OptionConstants.depthIntoPile)),
                  ]),
                  Row(children: [
                    _labeledField(
                        'Climb',
                        _dropdown(AutonomousValues.autoClimb,
                            OptionConstants.autoClimbOptions)),
                  ]),
                  Row(children: [
                    _labeledField(
                        'Times Beached',
                        CounterNumberField(
                          controller: AutonomousValues.autoBeachCount,
                          onTapIncrement: () {
                            setState(() {
                              final count = int.tryParse(
                                      AutonomousValues.autoBeachCount.text) ??
                                  0;
                              AutonomousValues.autoBeachCount.text =
                                  (count + 1).toString();
                            });
                          },
                          onTapDecrement: () {
                            setState(() {
                              final count = int.tryParse(
                                      AutonomousValues.autoBeachCount.text) ??
                                  0;
                              AutonomousValues.autoBeachCount.text =
                                  (count > 0 ? count - 1 : 0).toString();
                            });
                          },
                        )),
                  ]),
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
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(130.0, 36.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            backgroundColor: AppStyle.accent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context,
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
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),

                    const SizedBox(width: 10.0),

                    // next page button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130.0, 36.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        backgroundColor: AppStyle.accent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
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
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
