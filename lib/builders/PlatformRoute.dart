// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/components/navigation/NavigationSidebar.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
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
  Color appBarColor = AppStyle.textInputColor;

  @override
  void initState() {
    super.initState();
    _loadColor();
    if(!SettingValues.isTeamListenerRegistered) {
      SettingValues.isTeamListenerRegistered = true;
      Stream.periodic(Duration(seconds: 1)).listen((_) {
        _loadColor();
      });
    }
  }

  void _loadColor() async {
    appBarColor = await UIHelper.getAppBarColour();
    setState(() {
      appBarColor = appBarColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            key: scaffoldKey,
            drawer: const NavigationSidebar(),
            backgroundColor: UIHelper.getBackgroundColour(),
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(40.0),
                child: AppBar(
                  backgroundColor: appBarColor,
                  title: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Futura', color: Colors.white),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.lunch_dining, color: Colors.white),
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                )),
            body: widget.body));
  }
}
