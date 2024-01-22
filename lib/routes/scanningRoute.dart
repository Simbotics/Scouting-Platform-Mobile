// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/routePage.dart';

class scanningRoute extends StatelessWidget {
  const scanningRoute({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return RoutePage(
      title: title,
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
        children: [
         
        ], )
      ),
    );
  }
}
