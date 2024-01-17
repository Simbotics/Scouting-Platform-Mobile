// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_platform/builders/sidebarItem.dart';
import 'package:scouting_platform/routes/dataInput/commentsRoute.dart';
import 'package:scouting_platform/routes/dataInput/dataInputRoute.dart';
import 'package:scouting_platform/routes/landing/inputRoute.dart';
import 'package:scouting_platform/ui/style/style.dart';

class NavigationSidebar extends StatelessWidget {
  const NavigationSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppStyle.textInputColor,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "assets/images/nav_banner.png")), // Change this to whatever you want the sidebar banner to be
            ),
            child: null,
          ),
          const SidebarItem(
              icon: Icon(Icons.verified),
              itemName: "Input",
              route: InputRoute(title: 'Input')),
          const Divider(),
          const SidebarItem(
              icon: Icon(Icons.verified), 
              itemName: "Comments",
              route: commentsRoute(title: 'Comments')),
          const Divider(),
          const SidebarItem(
              icon: Icon(Icons.verified),
              itemName: "Data Input",
              route: dataInputRoute(title: 'Data Input')),
          ListTile(
            title: const Text('Exit',
                style: TextStyle(
                    fontFamily: 'Futura', fontWeight: FontWeight.bold)),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => {SystemNavigator.pop()},
          ),
        ],
      ),
    );
  }
}
