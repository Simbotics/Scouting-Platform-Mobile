// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousRightLabel2 extends StatefulWidget {
  const AutonomousRightLabel2({
    super.key,
  });

  @override
  State<AutonomousRightLabel2> createState() => _AutonomousRightLabel2State();
}

class _AutonomousRightLabel2State extends State<AutonomousRightLabel2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // coral miss auto
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 160.0,
              padding: const EdgeInsets.only(top: 20.0, right: 0.0),
              child: const Text(
                "Coral Missed",
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
