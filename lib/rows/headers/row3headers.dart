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
  // Dropdown menu options
  final List<String> yesNoOptions = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
