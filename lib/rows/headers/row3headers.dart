// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Row3Headers extends StatefulWidget {
  const Row3Headers({
    Key? key,
  }) : super(key: key);

  @override
  _Row3HeadersState createState() => _Row3HeadersState();
}

class _Row3HeadersState extends State<Row3Headers> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Auto time to balance
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: const Text(
              "Time To Balance",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        // Auto low scored
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(top: 20.0),
            child: const Text(
              "Low",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        // Teleop cones low scored
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 62.0, top: 20.0),
            child: const Text(
              "Cones Low",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        // Teleop cubes low scored
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 62.0, top: 20.0),
            child: const Text(
              "Cubes Low",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        // Teleop charging station crosses
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 250.0,
            padding: const EdgeInsets.only(left: 62.0, top: 20.0),
            child: const Text(
              "Charge Station Crosses",
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
