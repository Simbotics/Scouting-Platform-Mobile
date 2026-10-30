// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';
import 'package:scouting_platform/routes/auto/AutonomousDataRoute.dart';
import 'package:scouting_platform/routes/comments/CommentsRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

class TeleopRoute extends StatefulWidget {
  const TeleopRoute({super.key, required this.title});
  final String title;

  @override
  State<TeleopRoute> createState() => _TeleopRouteState();
}

class _TeleopRouteState extends State<TeleopRoute> {
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
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    _labeledField(
                      'Scoring',
                      _dropdown(TeleoperatedValues.teleopScoring,
                          OptionConstants.yesNoOptions),
                    ),
                    _labeledField(
                      'Passing',
                      _dropdown(TeleoperatedValues.teleopPassing,
                          OptionConstants.yesNoOptions),
                    ),
                    _labeledField(
                      'Clean Up',
                      _dropdown(TeleoperatedValues.teleopCleanUp,
                          OptionConstants.yesNoOptions),
                    )
                  ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    _labeledField(
                      'Cycles',
                      _dropdown(TeleoperatedValues.teleopCycles,
                          OptionConstants.yesNoOptions),
                    ),
                    _labeledField(
                      'Stealing',
                      _dropdown(TeleoperatedValues.teleopStealing,
                          OptionConstants.yesNoOptions),
                    ),
                    _labeledField(
                      'Defense',
                      _dropdown(TeleoperatedValues.teleopDefence,
                          OptionConstants.yesNoOptions),
                    )
                  ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    _labeledField(
                      'Got Defended',
                      _dropdown(TeleoperatedValues.teleopGetDefended,
                          OptionConstants.yesNoOptions),
                    ),
                    _labeledField(
                      'Broken',
                      _dropdown(TeleoperatedValues.teleopBroken,
                          OptionConstants.yesNoOptions),
                    ),
                    _labeledField(
                      'Dead',
                      _dropdown(TeleoperatedValues.teleopDead,
                          OptionConstants.yesNoOptions),
                    )
                  ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    _labeledField(
                      'Back To Life',
                      _dropdown(TeleoperatedValues.teleopBackToLife,
                          OptionConstants.yesNoOptions),
                    ),
                    _labeledField(
                      'Beached',
                      CounterNumberField(
                        controller: TeleoperatedValues.teleopBeachCount,
                        onTapIncrement: () {
                          setState(() {
                            final count = int.tryParse(
                                    TeleoperatedValues.teleopBeachCount.text) ??
                                0;
                            TeleoperatedValues.teleopBeachCount.text =
                                (count + 1).toString();
                          });
                        },
                        onTapDecrement: () {
                          setState(() {
                            final count = int.tryParse(
                                    TeleoperatedValues.teleopBeachCount.text) ??
                                0;
                            TeleoperatedValues.teleopBeachCount.text =
                                (count > 0 ? count - 1 : 0).toString();
                          });
                        },
                      ),
                    ),
                    _labeledField(
                      'Climb',
                      _dropdown(EndgameValues.endGameClimb,
                          OptionConstants.endgameOptions),
                    )
                  ]),
                ],
              )),
          Expanded(
              child: Column(
            children: [
              // Top-right aligned buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                          return const AutonomousDataRoute(title: "Auto");
                        }));
                      },
                      child: const Text("< Auto",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 10.0),
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
                          return const CommentsRoute(title: "Comments");
                        }));
                      },
                      child: const Text("Comments >",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ]),
      ),
    );
  }
}
