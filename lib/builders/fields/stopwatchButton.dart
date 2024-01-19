// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

/// THIS CLASS IS DEPRECATED AND IS NO LONGER SUPPORTED FOR USE
/// Please refer to previous years of for usage of this class
/// NO SUPPORT WILL BE PROVIDED FOR THIS CLASSES USAGE
class StopwatchButton extends StatelessWidget {
  final TextEditingController state;
  final Stopwatch timer;

  const StopwatchButton({
    Key? key,
    required this.state,
    required this.timer,
  }) : super(key: key);

  String returnFormattedText() {
    int milli = timer.elapsed.inMilliseconds;

    if(milli == 0){
      return "Start Timer";
    }
 
    String milliseconds = (milli % 1000).toString().padLeft(1, "0"); 
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0"); 
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(1, "0"); 
 
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(150.0, 47.0),
            backgroundColor: AppStyle.textInputColor,
            shape:const ContinuousRectangleBorder(),
            ),
            onPressed: () {
              if(int.parse(state.text) == 1){
                timer.stop();
                state.text = "2";
              }else if(int.parse(state.text) == 2){
                state.text = "3";
              }else if(int.parse(state.text) == 3){
                timer.reset();
                state.text = "0";
             }else{
                timer.start();
                state.text = "1";
             }
            },
        child: Text(returnFormattedText(),
            style: const TextStyle(fontSize: 16.0, fontFamily: "Helvetica", color: Colors.white)),
      ),
    );
  }
}
