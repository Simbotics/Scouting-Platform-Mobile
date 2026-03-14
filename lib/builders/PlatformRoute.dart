// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/components/navigation/NavigationSidebar.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants.dart';

class PlatformRoute extends StatefulWidget {
  final String title; // Title of the page
  final Widget body; // Body of the page

  const PlatformRoute(
      {super.key,
      this.title = "${AppConstants.appName} - ${AppConstants.year}",
      required this.body});

  @override
  State<PlatformRoute> createState() => _PlatformRouteState();
}

class _PlatformRouteState extends State<PlatformRoute> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: scaffoldKey,
        drawer: const NavigationSidebar(),
        backgroundColor: UIHelper.getBackgroundColour(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: AppBar(
            backgroundColor: AppStyle.textInputColor,
            title: Text(
                "${widget.title}   Driver Station: ${SettingValues.selectedDriverStation.text}, Match #${PrematchValues.matchNumber.text}, Team #${PrematchValues.teamNumber.text}, Capacity #${PrematchValues.hopperCapacity.text}",
                textAlign: TextAlign.center,
                style: AppStyle.headerText),
            leading: IconButton(
              icon: const Icon(Icons.lunch_dining, color: Colors.white),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
        ),
        // Center a constrained card so each route looks tidy and consistent.
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                color: AppStyle.cardBackground,
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: widget.body,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
