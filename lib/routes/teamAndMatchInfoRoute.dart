// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/routes/dataInput/fields/teamAndMatchInfoFields.dart';
import 'package:scouting_platform/routes/dataInput/labels/teamAndMatchInfoLabels.dart';

class teamAndMatchInfo extends StatelessWidget {
  const teamAndMatchInfo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return RoutePage(
      title: title,
      body: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              teamAndMatchInfoLabels(),
              teamAndMatchInfoFields()
            ],
          )),
    );
  }
}
