// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Row1Labels extends StatefulWidget {
  const Row1Labels({
    Key? key,
  }) : super(key: key);

  @override
  _Row1labelsState createState() => _Row1labelsState();
}

class _Row1labelsState extends State<Row1Labels> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
         // Auto mobility status
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 30.0),
            child: 
                const Text(
                  "Mobility",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                
                ),
              ) 
          ),
          //Auto Speaker Scored
          Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            margin: const EdgeInsets.only(left: 50.0),
            padding: const EdgeInsets.only(left: 25.0, top: 20.0),
            child: 
                const Text(
                  "Speaker Scored",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                
                ),
              ) 
          ),
          //auto speaker missed
          Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 25.0, top: 20.0),
            child: 
                const Text(
                  "Speaker Missed",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                
                ),
              ) 
          ),
          //auto amp scored
          Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 25.0, top: 20.0),
            child: 
                const Text(
                  "Amp Scored",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                
                ),
              ) 
          ),
          //Auto Amp Missed
          Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 170.0,
            padding: const EdgeInsets.only(left: 25.0, top: 20.0),
            child: 
                const Text(
                  "Amp Missed",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                
                ),
              ) 
          ),
        
        const Divider(),
        ],
    );
  }
}