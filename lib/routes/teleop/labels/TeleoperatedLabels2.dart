// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TeleoperatedLabels2 extends StatefulWidget {
  const TeleoperatedLabels2({
    super.key,
  });

  @override
  State<TeleoperatedLabels2> createState() => _TeleoperatedLabels2State();
}

class _TeleoperatedLabels2State extends State<TeleoperatedLabels2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // coral l2 scored
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 30.0),
              child: const Text(
                "L2 Coral",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // algae removed
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 30.0),
              child: const Text(
                "Algae Removed",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 30.0),
              child: const Text(
                "Defense Time",
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
