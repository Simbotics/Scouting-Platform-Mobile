// ignore_for_file: file_names
import 'package:flutter/services.dart';
import 'package:scouting_platform/routes/data/dataRoute.dart';
import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants..dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the screen orientation to landscape (either way)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight //i am so cool
  ]);

  runApp(const ScoutingPlatform());
}

class ScoutingPlatform extends StatelessWidget {
  const ScoutingPlatform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        home: InputRoute(
          title: "${AppConstants.appName} - ${AppConstants.year}",
        ) // Set this to what you want the default homepage to be
        );
  }
}
