// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_platform/builders/sidebarItem.dart';
import 'package:scouting_platform/routes/landing/landingRoute.dart';
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
              itemName: "Example Item 1",
              route: landingRoute(title: 'landing Route')),
          const Divider(),
          const SidebarItem(
              icon: Icon(Icons.verified), 
              itemName: "Example Item 2",
              route: landingRoute(title: 'Example Route 2')),
          const Divider(),
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
