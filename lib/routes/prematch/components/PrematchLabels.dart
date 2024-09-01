// ignore_for_file: file_names
import 'package:flutter/material.dart';

class PrematchLabels extends StatefulWidget {
  const PrematchLabels({
    Key? key,
  }) : super(key: key);

  @override
  State<PrematchLabels> createState() => _PrematchLabelsState();
}

class _PrematchLabelsState extends State<PrematchLabels> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Auto mobility status
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 30.0),
              child: const Text(
                "Initials",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // Match number
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: const Text(
                "Match Number",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // team number
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding: const EdgeInsets.only(left: 40.0, top: 20.0),
              child: const Text(
                "Team Number",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),

        const Divider(),
      ],
    );
  }
}
