// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_platform/utils/QRCodeHelper.dart';
import 'package:scouting_platform/utils/UIHelper.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';

class QRCodeRoute extends StatelessWidget {
  const QRCodeRoute({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    UIHelper.setBrightness(1.0);

    return PlatformRoute(
        title: title,
        body: Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                // Fit to fill the whole screen
                child: QrImageView(
                  data: QrcodeHelper.getQRCodeString(),
                  backgroundColor: Colors.white,
                  embeddedImage: SettingValues.currentSelectedCenterfold.text ==
                          "none"
                      ? null
                      : AssetImage(
                          "assets/images/centerfolds/${SettingValues.currentSelectedCenterfold.text}.png"),
                  errorCorrectionLevel: QrErrorCorrectLevel.L,
                  version: QrVersions.auto,
                ))));
  }
}
