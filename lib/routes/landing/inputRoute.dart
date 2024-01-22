// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/routes/dataInput/fields/autoDataFields.dart';
import 'package:scouting_platform/routes/dataInput/fields/teleopDataFields.dart';
import 'package:scouting_platform/routes/dataInput/fields/endgameDataFields.dart';
import 'package:scouting_platform/routes/dataInput/labels/autoDataLabels.dart';
import 'package:scouting_platform/routes/dataInput/labels/teleopDataLabels.dart';
import 'package:scouting_platform/routes/dataInput/labels/endgameDataLabels.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:scouting_platform/ui/style/style.dart';

class InputRoute extends StatelessWidget {
  const InputRoute({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return RoutePage(
      title: title,
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            TitleStyle(text: "Auto Data", padding: EdgeInsets.only(top: 10.0, left: 20.0)),
            Row1Labels(),
            Row1Fields(),
            Divider(color:AppStyle.redAlliance),
            TitleStyle(text: "Teleop Data", padding: EdgeInsets.only(top: 10.0, left: 20.0)),
            Row2Labels(),
            Row2Fields(),
            Divider(color:AppStyle.redAlliance),
            TitleStyle(text: "Endgame Data", padding: EdgeInsets.only(top: 10.0, left: 20.0)),
            Row3Labels(),
            Row3Fields(),
          ]
        ),
      ),
    );
  }
}
