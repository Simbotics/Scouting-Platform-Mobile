// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/fields/counterNumberField.dart';
import 'package:scouting_platform/builders/fields/dropdownMenu.dart';
import 'package:scouting_platform/builders/fields/textInputField.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:scouting_platform/utils/data/data.dart';

class CommentFields extends StatefulWidget {
  const CommentFields({
    Key? key,
  }) : super(key: key);

  @override
  _CommentFields createState() => _CommentFields();
}

class _CommentFields extends State<CommentFields> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleStyle(
            text: "Auto Comments",
            padding: EdgeInsets.only(top: 10.0, left: 18.0)),
        TextInputField(
          onChanged: (value) {
             setState(() {
                Data.autoComments.text = value;
              });
          }, 
          textAlign: TextAlign.left, 
          hintText: "Auto stuff", 
          controller: Data.autoComments,
          margin: const EdgeInsets.only(left: 40, top: 10),
          width: 880,
          height: 90.0,
          maxLines: 10,),
          TitleStyle(
            text: "Teleop Comments",
            padding: EdgeInsets.only(top: 10.0, left: 18.0)),
        TextInputField(
          onChanged: (value) {
             setState(() {
                Data.teleopComments.text = value;
              });
          }, 
          textAlign: TextAlign.left, 
          hintText: "More stuff", 
          controller: Data.teleopComments,
          margin: const EdgeInsets.only(left: 40, top: 10),
          width: 880,
          height: 90.0,
          maxLines: 10,),
          TitleStyle(
            text: "End Game Comments",
            padding: EdgeInsets.only(top: 10.0, left: 18.0)),
        TextInputField(
          onChanged: (value) {
             setState(() {
                Data.endgameComments.text = value;
              });
          }, 
          textAlign: TextAlign.left, 
          hintText: "Final stuff", 
          controller: Data.endgameComments,
          margin: const EdgeInsets.only(left: 40, top: 10),
          width: 880,
          height: 90.0,
          maxLines: 10,),
      ],
    );
  }
}