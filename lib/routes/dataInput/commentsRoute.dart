// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/textStyles/title.dart';

class commentsRoute extends StatelessWidget {
  const commentsRoute({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return RoutePage(
      title: title,
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: TitleStyle(
            text: "Comments",
            padding: EdgeInsets.only(top: 10.0, left: 18.0)),
      ),
    );
  }
}
