// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousLeftLabel2 extends StatefulWidget {
  const AutonomousLeftLabel2({
    super.key,
  });

  @override
  State<AutonomousLeftLabel2> createState() => _AutonomousLeftLabel2State();
}

class _AutonomousLeftLabel2State extends State<AutonomousLeftLabel2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: const EdgeInsets.only(left: 20)),
        // coral miss auto
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 160.0,
              padding: const EdgeInsets.only(top: 20.0, right: 0.0),
              child: const Text(
                "Ball Scored",
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
