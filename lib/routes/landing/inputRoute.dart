// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/routes/dataInput/fields/row1Fields.dart';
import 'package:scouting_platform/routes/dataInput/fields/row2Fields.dart';
import 'package:scouting_platform/routes/dataInput/fields/row3Fields.dart';
import 'package:scouting_platform/routes/dataInput/labels/row1Labels.dart';
import 'package:scouting_platform/routes/dataInput/labels/row2Labels.dart';
import 'package:scouting_platform/routes/dataInput/labels/row3Labels.dart';
import 'package:scouting_platform/textStyles/title.dart';

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
            TitleStyle(text: "Auto Data", padding: EdgeInsets.only(top: 10.0, left: 10.0)),
            Row1Labels(),
            Row1Fields(),
            TitleStyle(text: "Teleop Data", padding: EdgeInsets.only(top: 10.0, left: 10.0)),
            Row2Labels(),
            Row2Fields(),
            TitleStyle(text: "Endgame Data", padding: EdgeInsets.only(top: 10.0, left: 10.0)),
            Row3Labels(),
            Row3Fields(),
          ]
        ),
      ),
    );
  }
}
