import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_platform/main.dart';
import 'package:scouting_platform/routes/qrCode.dart';
import 'package:scouting_platform/routes/qrCodeScan.dart';
import 'package:scouting_platform/ui/style/style.dart';

class NavigationSidebar extends StatelessWidget {
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
                  image: NetworkImage(
                      "https://static.wixstatic.com/media/81d293_093b31dbf0db4a598f62334c8fac989a~mv2.png/v1/fill/w_220,h_140,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/81d293_093b31dbf0db4a598f62334c8fac989a~mv2.png")),
            ),
            child: null,
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text(
              'Scan',
              style:
                  TextStyle(fontFamily: 'Futura', fontWeight: FontWeight.bold),
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.draw),
            title: const Text('Field',
                style: TextStyle(
                    fontFamily: 'Futura', fontWeight: FontWeight.bold)),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Scouts',
                style: TextStyle(
                    fontFamily: 'Futura', fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SecondPage(title: 'My Scouting Data');
              })),
            },
          ),
          Divider(),
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
