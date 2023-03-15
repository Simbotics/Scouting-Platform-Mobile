import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_platform/routes/comments.dart';
import 'package:scouting_platform/routes/fieldSketchpad.dart';
import 'package:scouting_platform/routes/qrcode/currentQRCode.dart';
import 'package:scouting_platform/routes/qrcode/qrCodeScan.dart';
import 'package:scouting_platform/ui/style/style.dart';

class NavigationSidebar extends StatelessWidget {
  const NavigationSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppStyle.textInputColor,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/nav_banner.png")),
            ),
            child: null,
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble),
            title: const Text(
              'Comments',
              style:
                  TextStyle(fontFamily: 'Futura', fontWeight: FontWeight.bold),
            ),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Comments(title: 'Comments For Scout');
            })),
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text(
              'Scan',
              style:
                  TextStyle(fontFamily: 'Futura', fontWeight: FontWeight.bold),
            ),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ScanQRCode(title: 'Scan QR Code');
            })),
          ),
          ListTile(
            leading: const Icon(Icons.draw),
            title: const Text('Field',
                style: TextStyle(
                    fontFamily: 'Futura', fontWeight: FontWeight.bold)),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FieldSketchpad(title: 'Field Sketchpad');
            })),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Scouts',
                style: TextStyle(
                    fontFamily: 'Futura', fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CurrentQRCode(title: 'My Scouting Data');
              })),
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings',
                style: TextStyle(
                    fontFamily: 'Futura', fontWeight: FontWeight.bold)),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text('About',
                style: TextStyle(
                    fontFamily: 'Futura', fontWeight: FontWeight.bold)),
            onTap: () => null,
          ),
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
