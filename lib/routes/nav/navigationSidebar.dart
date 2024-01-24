// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_platform/builders/sidebarItem.dart';
import 'package:scouting_platform/main.dart';
import 'package:scouting_platform/routes/QRCode/currentQRCode.dart';
import 'package:scouting_platform/routes/dataInput/Comments/commentsRoute.dart';
import 'package:scouting_platform/routes/landing/inputRoute.dart';
import 'package:scouting_platform/routes/nav/settingsRoute.dart';
import 'package:scouting_platform/routes/scanningRoute.dart';
import 'package:scouting_platform/routes/teamAndMatchInfoRoute.dart';

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
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "assets/images/nav_banner.png")), // Change this to whatever you want the sidebar banner to be
            ),
            child: null,
          ),
          const SidebarItem(
              icon: Icon(Icons.description),
              itemName: "Team and Match Data",
              route: infoRoute(title: 'Team and Match Data')),
          const SidebarItem(
              icon: Icon(Icons.draw),
              itemName: "Data Input",
              route: InputRoute(title: 'Data Input')),
          const SidebarItem(
              icon: Icon(Icons.chat_bubble),
              itemName: "Comments",
              route: commentsRoute(title: "Comments")),
          const SidebarItem(
              icon: Icon(Icons.qr_code_2),
              itemName: "QR Code",
              route: CurrentQRCode(title: "QR Code")),
          const Divider(),
          const SidebarItem(icon: Icon(Icons.camera_alt_outlined), itemName: "Scanning", route: scanningRoute(title: "Scanning")),
          const SidebarItem(
              icon: Icon(Icons.settings),
              itemName: "Settings",
              route: settingsRoute()),
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
