// ignore_for_file: prefer_const_constructors, file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/utils/brightnessUtils.dart';
import 'package:scouting_platform/utils/data/data.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CurrentQRCode extends StatelessWidget {
  const CurrentQRCode({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    brightnessUtils.setBrightness(1.0);
    List<int> encoded = utf8.encode(
        "${int.tryParse(Data.teamNumber.text) ?? 0}^${int.tryParse(Data.matchNumber.text) ?? 0}^${Data.initials.text}^${Data.selectedDriverStation.text}^${int.parse(Data.autoSpeakerScored.text)}^${int.parse(Data.autoSpeakerMissed.text)}^${int.parse(Data.autoAmpScored.text)}^${int.parse(Data.autoAmpMissed.text)}^${Data.autoMobility.text}^${int.tryParse(Data.speaker.text)}^${int.tryParse(Data.speakerMissed.text) ?? 0}^${int.parse(Data.amp.text)}^${int.parse(Data.ampMissed.text)}^${int.parse(Data.passes.text)}^${Data.climb.text}^${int.parse(Data.climbTime.text)}^${int.parse(Data.trap.text)}^${Data.parked.text}^${Data.harmony.text}^${Data.autoComments.text.replaceAll("\n", "")}^${Data.autoOrder.text.replaceAll("\n", "")}^${Data.teleopComments.text.replaceAll("\n", "")}^${Data.endgameComments.text.replaceAll("\n", "")}^${Data.driverStations.indexOf(Data.selectedDriverStation.text)}");
    String base64String = base64.encode(encoded);

    return RoutePage(
        title: title,
        body: Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,

                // Fit to fill the whole screen
                child: QrImageView(
                  data: base64String,
                  backgroundColor: Colors.white,
                  embeddedImage: AssetImage(
                      "assets/images/centerfolds/${Data.currentSelectedCenterfold.text}.png"),
                  errorCorrectionLevel: QrErrorCorrectLevel.L,
                  version: QrVersions.auto,
                ))));
  }
}
