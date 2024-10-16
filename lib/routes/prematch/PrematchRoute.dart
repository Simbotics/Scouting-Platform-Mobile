// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/prematch/fields/PrematchFields.dart';
import 'package:scouting_platform/routes/prematch/labels/PrematchLabels.dart';
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

    AppDataHelper.getCurrentEventIDAndCurrentDriverStation().then((value) {
      if (value != "") {
        List<String> lineArray = value.split(",");
        setState(() {
          SettingValues.eventID.text = lineArray[0];
          SettingValues.selectedDriverStation.text = lineArray[1];
        });
      }
    });

    UIHelper.setBrightness(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformRoute(
      title: widget.title,
      body: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [PrematchLabels(), PrematchFields()],
          )),
    );
  }
}
