// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:scouting_platform/utils/data/uiUtils.dart';

import '../../ui/style/style.dart';
import '../nav/navigationSidebar.dart';

class ExampleRoute extends StatelessWidget {
  const ExampleRoute({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIUtils.getBackgroundColour(),
        drawer:
            const NavigationSidebar(), // Be sure not to forget to add this unless you don't want a sidebar button
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: AppBar(
              backgroundColor: AppStyle.textInputColor,
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Futura'),
              ),
            )),
        body: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: TitleStyle(
              text: "Example Page/Route",
              padding: EdgeInsets.only(top: 10.0, left: 18.0)),
        ));
  }
}
