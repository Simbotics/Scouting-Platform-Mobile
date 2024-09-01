// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/components/navigation/NavigationSidebar.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/UIHelper.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants..dart';

class PlatformRoute extends StatefulWidget {
  final String title; // Title of the page
  final Widget body; // Body of the page

  const PlatformRoute(
      {Key? key,
      this.title = "${AppConstants.appName} - ${AppConstants.year}",
      required this.body})
      : super(key: key);

  @override
  State<PlatformRoute> createState() => _PlatformRouteState();
}

class _PlatformRouteState extends State<PlatformRoute> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const NavigationSidebar(),
        backgroundColor: UIHelper.getBackgroundColour(),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: AppBar(
              backgroundColor: AppStyle.textInputColor,
              title: Text(
                widget.title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontFamily: 'Futura', color: Colors.white),
              ),
              leading: IconButton(
                icon: const Icon(Icons.lunch_dining, color: Colors.white),
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
            )),
        body: widget.body);
  }
}
