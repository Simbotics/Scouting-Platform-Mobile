// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/qrcode/DriverStationScanStatusRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/helpers/ScanningHelper.dart';

class ScannedDataPreviewRoute extends StatefulWidget {
  const ScannedDataPreviewRoute(
      {super.key, required this.title, required this.data});

  final String title;
  final List<String> data;

  @override
  State<ScannedDataPreviewRoute> createState() =>
      _ScannedDataPreviewRouteState();
}

class _ScannedDataPreviewRouteState extends State<ScannedDataPreviewRoute> {
  @override
  Widget build(BuildContext context) {
    return PlatformRoute(
        title: widget.title,
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(children: [
              /**
               * PLEASE REFERENCE QRCodeHelper.dart FOR THE INDEXES OF THE DATA
               */
              Row(
                children: [
                  Text("Team Number: ${widget.data[0]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Match Number: ${widget.data[1]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Initials: ${widget.data[2]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Driverstation: ${widget.data[3]}",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Text("Auto Speaker Scored: ${widget.data[4]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Auto Speaker Missed: ${widget.data[5]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Auto Amp Scored: ${widget.data[6]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Auto Amp Missed: ${widget.data[7]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Auto Mobility: ${widget.data[8]}",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Text("Teleop Speaker Scored: ${widget.data[9]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Teleop Speaker Missed: ${widget.data[10]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Teleop Amp Scored: ${widget.data[11]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Teleop Amp Missed: ${widget.data[12]}, ",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Text("Teleop Passes: ${widget.data[13]}",
                      style: const TextStyle(fontSize: 18)),
                  Text("Teleop Endgame: ${widget.data[14]}",
                      style: const TextStyle(fontSize: 18)),
                  Text("Teleop Climb Time: ${widget.data[15]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Teleop Trap: ${widget.data[16]}, ",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Text("Auto Comments: ${widget.data[17]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Auto Order: ${widget.data[18]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Teleop Comments: ${widget.data[19]}, ",
                      style: const TextStyle(fontSize: 18)),
                  Text("Endgame Comments: ${widget.data[20]}",
                      style: const TextStyle(fontSize: 18))
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyle
                          .textInputColorLight, // Set the background color here
                    ),
                    onPressed: () async {
                      setState(() {
                        ScanningHelper.unscannedDevices = ScanningHelper
                            .unscannedDevices
                            .where((element) => !element.contains(
                                widget.data[21]))
                            .toList();
                        if (!ScanningHelper.scannedDevices.contains(
                            widget.data[21])) {
                          ScanningHelper.scannedDevices
                              .add(widget.data[21]);
                        }
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DriverStationScanStatusRoute(
                          title: "Scanned Status",
                        );
                      }));
                      await ScanningHelper.generateCsv(
                          widget.data);
                    },
                    child: const Text(
                      'Save QR Code Data',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Helvetica",
                          color: Colors.white),
                    ),
                  ),
                ],
              )
            ])));
  }
}
