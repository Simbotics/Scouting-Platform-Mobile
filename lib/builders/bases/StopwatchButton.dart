// ignore_for_file: file_names
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:flutter/material.dart';

/// THIS CLASS IS DEPRECATED AND IS NO LONGER SUPPORTED FOR USE
/// Please refer to previous years of for usage of this class
/// NO SUPPORT WILL BE PROVIDED FOR THIS CLASSES USAGE
class StopwatchButton extends StatefulWidget {
  final TextEditingController value;
  final TextEditingController state;
  final Stopwatch timer;

  const StopwatchButton({
    Key? key,
    required this.value,
    required this.state,
    required this.timer,
  }) : super(key: key);

  @override
  State<StopwatchButton> createState() => _StopwatchButtonState();
}

class _StopwatchButtonState extends State<StopwatchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150.0, 47.0),
          backgroundColor: AppStyle.textInputColor,
          shape: const ContinuousRectangleBorder(),
        ),
        onPressed: () {
          if (int.parse(widget.state.text) == 1) {
            setState(() {
              widget.timer.stop();
              widget.state.text = "2";
              widget.value.text = returnFormattedText();
            });
          } else if (int.parse(widget.state.text) == 2) {
            setState(() {
              widget.state.text = "3";
            });
          } else if (int.parse(widget.state.text) == 3) {
            setState(() {
              widget.timer.reset();
              widget.state.text = "0";
            });
          } else {
            setState(() {
              widget.timer.start();
              widget.state.text = "1";
            });
          }
        },
        child: Text(returnFormattedText(),
            style: const TextStyle(
                fontSize: 16.0, fontFamily: "Helvetica", color: Colors.white)),
      ),
    );
  }

  String returnFormattedText() {
    int milli = widget.timer.elapsed.inMilliseconds;

    if (milli == 0) {
      return "Start Timer";
    } else if (int.parse(widget.state.text) == 1) {
      return "Stop Timer";
    }

    String milliseconds = (milli % 1000).toString().padLeft(1, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(1, "0");

    return "$minutes:$seconds:$milliseconds";
  }
}
