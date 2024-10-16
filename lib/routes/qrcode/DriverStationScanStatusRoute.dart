// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/qrcode/QRCodeScanningRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/styles/components/HeaderStyle.dart';
import 'package:scouting_platform/styles/components/TitleStyle.dart';
import 'package:scouting_platform/utils/helpers/ScanningHelper.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';

class DriverStationScanStatusRoute extends StatefulWidget {
  const DriverStationScanStatusRoute({super.key, required this.title});
  final String title; // Title of the page

  @override
  State<DriverStationScanStatusRoute> createState() =>
      _DriverStationScanStatusRouteState();
}

class _DriverStationScanStatusRouteState
    extends State<DriverStationScanStatusRoute> {
  @override
  Widget build(BuildContext context) {
    List<Widget> unscannedWidgets = []; // Unscanned devices widgets
    List<Widget> scannedWidgets = []; // Scanned devices widgets

    // If there are unscanned devices, add them to the list of unscanned widgets
    if (ScanningHelper.unscannedDevices.isNotEmpty) {
      List<InlineSpan> spans = [];
      for (int i = 0; i < ScanningHelper.unscannedDevices.length; i++) {
        String item = ScanningHelper.unscannedDevices[i];
        int? index = int.tryParse(item);
        if (index != null) {
          String driverStation = OptionConstants.availableDriverstations[index];
          Color textColor = driverStation.toLowerCase().contains('blue')
              ? Colors.blue
              : Colors.red;
          spans.add(TextSpan(
            text: driverStation,
            style: TextStyle(color: textColor, fontSize: 30.0),
          ));
        }
        if (i != ScanningHelper.unscannedDevices.length - 1) {
          spans.add(const TextSpan(
              style: TextStyle(fontSize: 30.0, color: Colors.white),
              text: ', '));
        }
      }
      unscannedWidgets.add(Text.rich(
        TextSpan(children: spans),
      ));
    }

    if (ScanningHelper.scannedDevices.isNotEmpty) {
      List<InlineSpan> scannedSpans = [];
      for (int i = 0; i < ScanningHelper.scannedDevices.length; i++) {
        String item = ScanningHelper.scannedDevices[i];
        String driverStation =
            OptionConstants.availableDriverstations[int.parse(item)];

        scannedSpans.add(TextSpan(
          text: driverStation,
          style: const TextStyle(color: Colors.green, fontSize: 30.0),
        ));

        if (i != ScanningHelper.scannedDevices.length - 1) {
          scannedSpans.add(const TextSpan(
            text: ', ',
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ));
        }
      }

      scannedWidgets.add(Text.rich(
        TextSpan(children: scannedSpans),
      ));
    }

    return PlatformRoute(
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
              const HeaderStyle(
                  text:
                      "Use this page to keep track of scanned driver \nstations. After every match, be sure to reset status's.",
                  padding: EdgeInsets.only(left: 10.0)),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
                              return const QRCodeScanningRoute(
                                title: "Scan QR Code",
                              );
                            }));
                          },
                          child: const Text(
                            "Scan Another Device",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
          ScanningHelper.unscannedDevices = ['0', '1', '2', '3', '4', '5'];
          ScanningHelper.scannedDevices = [];
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
