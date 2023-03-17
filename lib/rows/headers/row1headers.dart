// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

import '../../builders/numberFieldWithCounter.dart';
import '../../main.dart';
import '../../routes/comments.dart';
import '../../builders/dropdownMenu.dart';
import '../../builders/numberInputField.dart';
import '../../sections/autoScoutingData.dart';
import '../../sections/teleopScoutingData.dart';

class Row1Headers extends StatefulWidget {
  const Row1Headers({
    Key? key,
  }) : super(key: key);

  @override
  _Row1HeadersState createState() => _Row1HeadersState();
}

class _Row1HeadersState extends State<Row1Headers> {
  @override
  void initState() {
    super.initState();
  }

  // Dropdown menu options
  final List<String> yesNoOptions = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: const Text(
              "Auto Mobility",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(top: 20.0),
            child: const Text(
              "High",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 62.0, top: 20.0),
            child: const Text(
              "Cones High",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 62.0, top: 20.0),
            child: const Text(
              "Cubes High",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 200.0,
            padding: const EdgeInsets.only(left: 62.0, top: 20.0),
            child: const Text(
              "Teleop Balance",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
      ],
    );
  }
}
