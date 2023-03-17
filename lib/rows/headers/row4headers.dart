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

class Row4Headers extends StatefulWidget {
  const Row4Headers({
    Key? key,
  }) : super(key: key);

  @override
  _Row4HeadersState createState() => _Row4HeadersState();
}

class _Row4HeadersState extends State<Row4Headers> {
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
        const SizedBox(width: 70),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 101.0, top: 20.0),
            child: const Text(
              "Missed",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        const SizedBox(width: 2),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 280.0,
            padding: const EdgeInsets.only(left: 162.0, top: 20.0),
            child: const Text(
              "Cones Missed",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 42.0, top: 20.0),
            child: const Text(
              "Cubes Missed",
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
            padding: const EdgeInsets.only(left: 42.0, top: 20.0),
            child: const Text(
              "Cones Dropped",
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
