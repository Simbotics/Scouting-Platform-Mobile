// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scouting_platform/styles/AppStyle.dart';

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
  Timer? _updateTimer;

  @override
  void dispose() {
    _updateTimer?.cancel();
    super.dispose();
  }

  void startUpdatingUI() {
    _updateTimer?.cancel();
    _updateTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150.0, 47.0),
          backgroundColor: AppStyle.textInputColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        ),
        onLongPress: () {
          widget.timer.stop();
          widget.timer.reset();
          _updateTimer?.cancel();
          setState(() {});
        },
        onPressed: () {
          if (!widget.timer.isRunning) {
            widget.timer.start();
            startUpdatingUI();
          } else {
            widget.timer.stop();
            _updateTimer?.cancel();
            widget.value.text = widget.timer.elapsedMilliseconds.toString();
          }
          setState(() {});
        },
        child: Text(
          returnFormattedText(),
          style: const TextStyle(fontSize: 14.0, fontFamily: "Helvetica", color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  String returnFormattedText() {
    String formattedTime = returnFormattedTime();
    return widget.timer.isRunning
        ? "Running... \n $formattedTime"
        : "Start Timer \n $formattedTime";
  }

  String returnFormattedTime() {
    int milli = widget.timer.elapsedMilliseconds;
    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  int returnTime() {
    return widget.timer.elapsedMicroseconds;
  }
}
