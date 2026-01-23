// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TeleoperatedLabels extends StatefulWidget {
  const TeleoperatedLabels({
    super.key,
  });

  @override
  State<TeleoperatedLabels> createState() => _TeleoperatedLabelsState();
}

class _TeleoperatedLabelsState extends State<TeleoperatedLabels> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //coral l1 near
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 20.0,
              ),
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
