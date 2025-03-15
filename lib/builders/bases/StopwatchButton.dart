// ignore_for_file: file_names
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:flutter/material.dart';

/// THIS CLASS IS DEPRECATED AND IS NO LONGER SUPPORTED FOR USE
/// Please refer to previous years of for usage of this class
/// NO SUPPORT WILL BE PROVIDED FOR THIS CLASSES USAGE
class StopwatchButton extends StatefulWidget {
  final TextEditingController value;
  final Stopwatch timer;

  const StopwatchButton({
    super.key,
    required this.value,
    required this.timer,
  });

  @override
  State<StopwatchButton> createState() => _StopwatchButtonState();
}

class _StopwatchButtonState extends State<StopwatchButton> {
  @override
  Widget build(BuildContext context) {
    String _text = returnFormattedText();

    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150.0, 47.0),
          backgroundColor: AppStyle.textInputColor,
          shape: const ContinuousRectangleBorder(),
        ),
        onLongPress: () {
          widget.timer.stop();
          widget.timer.reset();
          setState(() {
            _text = "Start Timer";
          });
        },
        onPressed: () {
          if (!widget.timer.isRunning) {
            widget.timer.start();
            setState(() {
              _text = "Running...";
            });
          } else {
            widget.timer.stop();
            setState(() {
              widget.value.text = widget.timer.elapsedMilliseconds.toString();
              _text = widget.timer.elapsedMilliseconds.toString();
            });
          }
        },
        child: Text(_text,
            style: const TextStyle(
                fontSize: 16.0, fontFamily: "Helvetica", color: Colors.white)),
      ),
    );
  }

  String returnFormattedText() {
    int milli = widget.timer.elapsedMilliseconds;

    if (milli == 0) {
      return "Start Timer";
    } else if (widget.timer.isRunning) {
      return "Running...";
    }

    // String milliseconds = (milli % 1000).toString().padLeft(1, "0");
    // String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    // String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(1, "0");

    return milli.toString();
  }
}
