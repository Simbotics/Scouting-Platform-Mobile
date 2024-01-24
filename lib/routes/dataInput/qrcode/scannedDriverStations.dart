import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/routePage.dart';
import 'package:scouting_platform/routes/dataInput/qrcode/qrCodeScanning.dart';
import 'package:scouting_platform/textStyles/header.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/data.dart';

class scannedDriverStations extends StatefulWidget {
  const scannedDriverStations({Key? key, required this.title})
      : super(key: key);
  final String title; // Title of the page

  @override
  State<scannedDriverStations> createState() => _scannedDriverStationsState();
}

class _scannedDriverStationsState extends State<scannedDriverStations> {
  @override
  Widget build(BuildContext context) {
    List<Widget> unscannedWidgets = []; // Unscanned devices widgets
    List<Widget> scannedWidgets = []; // Scanned devices widgets

    // If there are unscanned devices, add them to the list of unscanned widgets
    if (Data.unscannedDevices.isNotEmpty) {
      List<InlineSpan> spans = [];
      for (int i = 0; i < Data.unscannedDevices.length; i++) {
        String item = Data.unscannedDevices[i];
        String driverStation = Data.driverStations[int.parse(item)];
        Color textColor = driverStation.toLowerCase().contains('blue') ? Colors.blue : Colors.red;
        spans.add(TextSpan(
          text: driverStation,
          style: TextStyle(color: textColor, fontSize: 30.0),
        ));
        if (i != Data.unscannedDevices.length - 1) {
          spans.add(const TextSpan(style: TextStyle(fontSize: 30.0, color: Colors.white), text: ', '));
        }
      }
      unscannedWidgets.add(Text.rich(
        TextSpan(children: spans),
      ));
    }

    // If there are scanned devices, add them to the list of scanned widgets
    if (Data.scannedDevices.isNotEmpty) {
      for (String item in Data.scannedDevices) {
        scannedWidgets.add(Text(
          "${Data.driverStations[int.parse(item)]}, ",
          style: const TextStyle(color: Colors.green, fontSize: 30.0),
        ));
      }
    }

    return RoutePage(
      title: widget.title,
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                // Title for the section
                const TitleStyle(
                    text: "Scanning Status",
                    padding: EdgeInsets.only(left: 10.0)),
                const HeaderStyle(text: "Use this page to keep track of scanned driver \nstations. After every match, be sure to reset status's.", padding: EdgeInsets.only(left: 10.0)),
                // Header for the unscanned devices
                const TitleStyle(
                    text: "Unscanned Driver Stations",
                    padding: EdgeInsets.only(left: 10.0, top: 10.0)),
                // List of unscanned devices
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(children: unscannedWidgets),
                ),
                // Header for the scanned devices
                const TitleStyle(
                    text: "Scanned Driver Stations",
                    padding: EdgeInsets.only(left: 10.0, top: 10.0)),
                // List of scanned devices
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 24.0),
                  child: Row(children: scannedWidgets),
                ),
                // Reset scanned and unscanned devices button
                Row(children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          padding: const EdgeInsets.only(top: 24.0, left: 10.0),
                          height: 67.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const ContinuousRectangleBorder(),
                              backgroundColor: AppStyle
                                  .textInputColorLight, // Set the background color here
                            ),
                            onPressed: () {
                              showConformationDialog(context);
                            },
                            child: const Text(
                              "Reset Status's",
                              style: TextStyle(color: Colors.white, fontSize: 20.0),
                            ),
                          )))
                ]),
                // Scan another device button
                Row(children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          padding: const EdgeInsets.only(top: 24.0, left: 10.0),
                          height: 67.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const ContinuousRectangleBorder(),
                              backgroundColor: AppStyle
                                  .textInputColorLight, // Set the background color here
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const qrCodeScanning(
                                  title: "Scan QR Code",
                                );
                              }));
                            },
                            child: const Text(
                              "Scan Another Device",
                              style: TextStyle(color: Colors.white, fontSize: 20.0),
                            ),
                          )))
                ]),
              ],
            )),
      );
  }

  /// Shows alert dialog to confirm if the user wants to reset the scanned devices
  showConformationDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        setState(() {
          // ScanningData.unscannedDevices = ['0', '1', '2', '3', '4', '5'];
          // ScanningData.scannedDevices = [];
        });
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirmation: Reset Scanned Devices"),
      content: const Text(
          "Would you like to reset all of the devices you've scanned and haven't?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}