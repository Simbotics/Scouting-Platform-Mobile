// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/builders/bases/NumberInputField.dart';
import 'package:scouting_platform/builders/bases/TextInputField.dart';
import 'package:scouting_platform/routes/auto/AutonomousDataRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/helpers/AppDataHelper.dart';

class PrematchRoute extends StatefulWidget {
  const PrematchRoute({super.key, required this.title});
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _PrematchRouteState createState() => _PrematchRouteState();
}

class _PrematchRouteState extends State<PrematchRoute> {
  @override
  void initState() {
    super.initState();

    _loadEventAndDriverStation();
    UIHelper.setBrightness(0.3);
  }

  Future<void> _loadEventAndDriverStation() async {
    final value =
        await AppDataHelper.getCurrentEventIDAndCurrentDriverStation();
    if (!mounted) return;
    if (value.isNotEmpty) {
      final parts = value.split(',');
      setState(() {
        SettingValues.eventID.text = parts[0];
        SettingValues.selectedDriverStation.text = parts[1];
      });
    }
    // Use the saved event and station before looking up the current match.
    await _updateTeamNumber();
  }

  Future<void> _updateTeamNumber() async {
    if (!SettingValues.isTeamNumberReadOnly) return;
    final matchText = PrematchValues.matchNumber.text;
    final matchNumber = int.tryParse(matchText);
    if (matchNumber == null) return;

    final teamNumber =
        (await Schedulehelper.getTeamNumberFromSchedule(matchNumber))
            .toString();
    final capacity = await Schedulehelper.findRobotCapacity(teamNumber);
    if (!mounted ||
        PrematchValues.matchNumber.text != matchText ||
        !SettingValues.isTeamNumberReadOnly) {
      return;
    }

    setState(() {
      PrematchValues.teamNumber.text = teamNumber;
      PrematchValues.hopperCapacity.text = capacity;
    });
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

  @override
  Widget build(BuildContext context) {
    return PlatformRoute(
      title: widget.title,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _labeledField(
                'Initials',
                TextInputField(
                  controller: PrematchValues.initials,
                  hintText: 'Scout Initials',
                  textAlign: TextAlign.center,
                  margin: EdgeInsets.zero,
                  onChanged: (value) {},
                )),
            _labeledField(
                'Match Number',
                NumberInputField(
                  controller: PrematchValues.matchNumber,
                  hintText: 'Match Number',
                  margin: EdgeInsets.zero,
                  onChanged: (value) => _updateTeamNumber(),
                )),
            _labeledField(
                'Team Number',
                NumberInputField(
                  controller: PrematchValues.teamNumber,
                  hintText: 'Team Number',
                  readOnly: SettingValues.isTeamNumberReadOnly,
                  margin: EdgeInsets.zero,
                  onChanged: (value) {},
                )),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(130, 36),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  backgroundColor: AppStyle.accent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AutonomousDataRoute(title: 'Auto'),
                      ));
                },
                child: const Text('Auto >',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
