// ignore_for_file: file_names
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the screen orientation to landscape (either way)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight //i am so cool
  ]);

  UIHelper.setBrightness(0.3);

  runApp(const ScoutingPlatform());
}

class ScoutingPlatform extends StatelessWidget {
  const ScoutingPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        home: PrematchRoute(
          title: "Prematch Data",
        ));
  }
}
