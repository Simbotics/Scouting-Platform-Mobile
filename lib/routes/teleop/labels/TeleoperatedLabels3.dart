// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TeleoperatedLabels3 extends StatefulWidget {
  const TeleoperatedLabels3({
    super.key,
  });

  @override
  State<TeleoperatedLabels3> createState() => _TeleoperatedLabels3State();
}

class _TeleoperatedLabels3State extends State<TeleoperatedLabels3> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // climb time
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 30.0),
              child: const Text(
                "Climb Time",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // endgame
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 30.0),
              child: const Text(
                "Endgame",
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
