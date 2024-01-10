import 'package:flutter/services.dart';
import 'package:scouting_platform/routes/landing/landingRoute.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scouting_platform/routes/nav/navigationSidebar.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/uiUtils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the screen orientation to landscape (either way)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const ScoutingPlatform());
}

class ScoutingPlatform extends StatelessWidget {
  const ScoutingPlatform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Scouting Platform",
        debugShowCheckedModeBanner: false,
        home: landingRoute(
            title:
                "Example Route: Home") // Set this to what you want the default homepage to be
        );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static MobileScannerController cameraController =
      MobileScannerController(); // Camera controller for scanning QR codes
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationSidebar(),
        backgroundColor: UIUtils.getBackgroundColour(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: AppStyle.textInputColor,
            title: const Text(
              "Scouting Platform - Blank",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Futura'),
            ),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        body: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            SizedBox(
              height: 5,
            ),
            Text("Example Homepage")
          ]),
        ));
  }
}
