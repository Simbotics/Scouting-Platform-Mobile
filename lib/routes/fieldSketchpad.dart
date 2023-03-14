// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../main.dart';
import '../ui/style/style.dart';

class FieldSketchpad extends StatelessWidget {
  const FieldSketchpad({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: AppStyle.textInputColor,
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Futura'),
            ),
          )),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            }));
          },
          child: const Center(
            child: Text("test"),
          ),
        ),
      ),
    );
  }
}
