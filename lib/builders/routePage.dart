// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/routes/nav/navigationSidebar.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/uiUtils.dart';

class RoutePage extends StatefulWidget {
  final String title; // Title of the page
  final Widget body; // Body of the page

  const RoutePage({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const NavigationSidebar(),
        backgroundColor: UIUtils.getBackgroundColour(),
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
