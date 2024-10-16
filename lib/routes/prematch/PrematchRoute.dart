// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/prematch/fields/PrematchFields.dart';
import 'package:scouting_platform/routes/prematch/labels/PrematchLabels.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

class PrematchRoute extends StatelessWidget {
  const PrematchRoute({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    UIHelper.setBrightness(0.3);

    return PlatformRoute(
      title: title,
      body: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [PrematchLabels(), PrematchFields()],
          )),
    );
  }
}
