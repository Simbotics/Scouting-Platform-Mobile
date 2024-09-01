// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_platform/components/navigation/components/SidebarItem.dart';
import 'package:scouting_platform/routes/comments/commentsRoute.dart';
import 'package:scouting_platform/routes/data/dataRoute.dart';
import 'package:scouting_platform/routes/qrcode/DriverStationScanStatusRoute.dart';
import 'package:scouting_platform/routes/qrcode/QRCodeRoute.dart';
import 'package:scouting_platform/routes/settings/settingsRoute.dart';
import 'package:scouting_platform/routes/prematch/prematchRoute.dart';

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
              route: PrematchRoute(title: 'Team and Match Data')),
          const SidebarItem(
              icon: Icon(Icons.draw),
              itemName: "Data Input",
              route: InputRoute(title: 'Data Input')),
          const SidebarItem(
              icon: Icon(Icons.chat_bubble),
              itemName: "Comments",
              route: CommentsRoute(title: "Comments")),
          const SidebarItem(
              icon: Icon(Icons.qr_code_2),
              itemName: "QR Code",
              route: QRCodeRoute(title: "QR Code")),
          const Divider(),
          const SidebarItem(
              icon: Icon(Icons.camera_alt_outlined),
              itemName: "Scanning",
              route: DriverStationScanStatusRoute(title: "Scanning")),
          const SidebarItem(
              icon: Icon(Icons.settings),
              itemName: "Settings",
              route: SettingsRoute()),
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
