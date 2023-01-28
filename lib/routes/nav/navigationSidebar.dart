import 'package:flutter/material.dart';
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
                  image: AssetImage('assets/images/navBanner.png')),
            ),
            child: null,
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Scan'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.draw),
            title: const Text('Field'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Scouts'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text('About'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
