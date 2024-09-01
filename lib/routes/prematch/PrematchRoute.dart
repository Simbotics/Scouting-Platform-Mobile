// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/prematch/components/PrematchFields.dart';
import 'package:scouting_platform/routes/prematch/components/PrematchLabels.dart';

class PrematchRoute extends StatelessWidget {
  const PrematchRoute({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
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
