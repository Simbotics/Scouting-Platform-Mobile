// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

/// THIS CLASS IS DEPRECATED AND IS NO LONGER SUPPORTED FOR USE
/// Please refer to previous years of for usage of this class
/// NO SUPPORT WILL BE PROVIDED FOR THIS CLASSES USAGE
class StopwatchButton extends StatelessWidget {
  final String variable;
  final String text;
  final Function stopwatchMethod;

  const StopwatchButton({
    Key? key,
    required this.variable,
    required this.text,
    required this.stopwatchMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(150.0, 47.0),
            backgroundColor: AppStyle.textInputColorLight),
        onPressed: () {
          stopwatchMethod();
        },
        child: Text(text,
            style: const TextStyle(fontSize: 16.0, fontFamily: "Helvetica")),
      ),
    );
  }
}
