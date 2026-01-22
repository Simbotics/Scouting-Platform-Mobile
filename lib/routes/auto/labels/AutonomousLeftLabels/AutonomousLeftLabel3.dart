// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousLeftLabel3 extends StatefulWidget {
  const AutonomousLeftLabel3({
    super.key,
  });

  @override
  State<AutonomousLeftLabel3> createState() => _AutonomousLeftLabel3State();
}

class _AutonomousLeftLabel3State extends State<AutonomousLeftLabel3> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: const EdgeInsets.only(left: 20)),
        // Climb Time
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 160.0,
              padding: const EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0),
              child: const Text(
                "Climb TIme",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // Climb Position
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 160.0,
              padding: const EdgeInsets.only(top: 20.0, right: 0.0),
              child: const Text(
                "Climb Position",
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
