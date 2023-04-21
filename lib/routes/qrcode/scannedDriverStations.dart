// ignore_for_file: file_names
import 'package:scouting_platform/routes/qrcode/qrCodeScan.dart';
import 'package:scouting_platform/textStyles/header.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:flutter/material.dart';
import 'package:scouting_platform/routes/nav/navigationSidebar.dart';
import 'package:scouting_platform/ui/style/style.dart';
import 'package:scouting_platform/utils/data/scanningData.dart';
import 'package:scouting_platform/utils/data/schedulingData.dart';
import 'package:scouting_platform/utils/data/uiUtils.dart';

class ScannedDriverStations extends StatefulWidget {
  const ScannedDriverStations({Key? key, required this.title})
      : super(key: key);
  final String title; // Title of the page

  @override
  State<ScannedDriverStations> createState() => _ScannedDriverStationsState();
}

class _ScannedDriverStationsState extends State<ScannedDriverStations> {
  @override
  Widget build(BuildContext context) {
    List<Widget> unscannedWidgets = []; // Unscanned devices widgets
    List<Widget> scannedWidgets = []; // Scanned devices widgets

    // If there are unscanned devices, add them to the list of unscanned widgets
    if (ScanningData.unscannedDevices.isNotEmpty) {
      for (String item in ScanningData.unscannedDevices) {
        unscannedWidgets.add(Text(
          SchedulingData.driverStations[int.parse(item)] + ", ",
          style: const TextStyle(color: Colors.red, fontSize: 30.0),
        ));
      }
    }

    // If there are scanned devices, add them to the list of scanned widgets
    if (ScanningData.scannedDevices.isNotEmpty) {
      for (String item in ScanningData.scannedDevices) {
        scannedWidgets.add(Text(
          SchedulingData.driverStations[int.parse(item)] + ", ",
          style: const TextStyle(color: Colors.green, fontSize: 30.0),
        ));
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // Navigation sidebar
        drawer: const NavigationSidebar(),
        // Background color and pixel resize fix
        backgroundColor: UIUtils.getBackgroundColour(),

        // Top navigation bar
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: AppBar(
              backgroundColor: AppStyle.textInputColor,
              title: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Futura'),
              ),
            )),

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
                // Header for the unscanned devices
                const HeaderStyle(
                    text: "Unscanned Driver Stations",
                    padding: EdgeInsets.only(left: 10.0, top: 10.0)),
                // List of unscanned devices
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(children: unscannedWidgets),
                ),
                // Header for the scanned devices
                const HeaderStyle(
                    text: "Scanned Driver Stations",
                    padding: EdgeInsets.only(left: 10.0, top: 10.0)),
                // List of scanned devices
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
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
                              backgroundColor: AppStyle
                                  .textInputColorLight, // Set the background color here
                            ),
                            onPressed: () {
                              showConformationDialog(context);
                            },
                            child: const Text(
                              "Reset Status's",
                              style: TextStyle(fontSize: 20.0),
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
                              backgroundColor: AppStyle
                                  .textInputColorLight, // Set the background color here
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ScanQRCode(
                                  title: "Scan QR Code",
                                );
                              }));
                            },
                            child: const Text(
                              "Scan Another Device",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          )))
                ]),
              ],
            )),
      ),
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
          ScanningData.unscannedDevices = ['0', '1', '2', '3', '4', '5'];
          ScanningData.scannedDevices = [];
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
