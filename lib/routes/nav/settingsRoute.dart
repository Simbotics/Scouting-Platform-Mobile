// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/fields/dropdownMenu.dart';
import 'package:scouting_platform/builders/fields/textInputField.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:scouting_platform/utils/data/data.dart';

class settingsRoute extends StatefulWidget {
  const settingsRoute({
    Key? key,
  }) : super(key: key);

  @override
  _settingsRoute createState() => _settingsRoute();
}

class _settingsRoute extends State<settingsRoute> {

 

  @override
  Widget build(BuildContext context) {
    return RoutePage(title: "Settings", 
    body: Center(
    child: 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleStyle(
          text: "Driver Station", 
          padding: EdgeInsets.only(left: 40, top: 10)),
        ScoutingDropdownMenu(
          margin: EdgeInsets.only(left: 40, top: 10),
          dropdownMenuSelectedItem: Data.selectedDriverStation.text, 
          onChanged: (value) {
              setState(() {
                Data.selectedDriverStation.text = value;
              });
            },
          dropdownItems: Data.driverStations),
        TitleStyle(
          text: "Event ID", 
          padding: EdgeInsets.only(left: 40, top: 10)),
        TextInputField(
          onChanged: (value){
            setState((){
              Data.eventID.text = value;});
          }, 
          textAlign: TextAlign.left, 
          hintText: "Event ID", 
          controller: Data.eventID,
          margin: EdgeInsets.only(left: 40, top: 10)),
        TitleStyle(
          text: "File Name", 
          padding: EdgeInsets.only(left: 40, top: 10)),
        TextInputField(
          onChanged: (value){
            setState((){
              Data.fileName.text = value;});
          }, 
          textAlign: TextAlign.left, 
          hintText: "File Name", 
          controller: Data.fileName,
          margin: EdgeInsets.only(left: 40, top: 10),),
          
      
      ],
    )
    )
    );
  }
}

