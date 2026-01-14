// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousLeftLabel1 extends StatefulWidget {
  const AutonomousLeftLabel1({
    super.key,
  });

  @override
  State<AutonomousLeftLabel1> createState() => _AutonomousLeftLabel1State();
}

class _AutonomousLeftLabel1State extends State<AutonomousLeftLabel1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: const EdgeInsets.only(left: 20)),
        // start pos
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 150.0,
              padding: const EdgeInsets.only(top: 20.0, right: 30.0),
              child: const Text(
                "Start Position",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // auto mobility
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding:
                  const EdgeInsets.only(left: 65.0, top: 20.0, right: 30.0),
              child: const Text(
                "Mobility",
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
