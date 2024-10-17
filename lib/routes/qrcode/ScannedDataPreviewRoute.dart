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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            _buildDataCard("Team Number: ${widget.data[0]}"),
            _buildDataCard("Match Number: ${widget.data[1]}"),
            _buildDataCard("Initials: ${widget.data[2]}"),
            _buildDataCard("Driver Station: ${widget.data[3]}"),
            _buildDataCard("Auto Speaker Scored: ${widget.data[4]}"),
            _buildDataCard("Auto Speaker Missed: ${widget.data[5]}"),
            _buildDataCard("Auto Amp Scored: ${widget.data[6]}"),
            _buildDataCard("Auto Amp Missed: ${widget.data[7]}"),
            _buildDataCard("Auto Mobility: ${widget.data[8]}"),
            _buildDataCard("Teleop Speaker Scored: ${widget.data[9]}"),
            _buildDataCard("Teleop Speaker Missed: ${widget.data[10]}"),
            _buildDataCard("Teleop Amp Scored: ${widget.data[11]}"),
            _buildDataCard("Teleop Amp Missed: ${widget.data[12]}"),
            _buildDataCard("Teleop Passes: ${widget.data[13]}"),
            _buildDataCard("Teleop Endgame: ${widget.data[14]}"),
            _buildDataCard("Teleop Climb Time: ${widget.data[15]}"),
            _buildDataCard("Teleop Trap: ${widget.data[16]}"),
            _buildDataCard("Auto Comments: ${widget.data[17]}"),
            _buildDataCard("Auto Order: ${widget.data[18]}"),
            _buildDataCard("Teleop Comments: ${widget.data[19]}"),
            _buildDataCard("Endgame Comments: ${widget.data[20]}"),
            const SizedBox(height: 20), // Space before the button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyle.textInputColorLight,
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 5,
              ),
              onPressed: () async {
                setState(() {
                  ScanningHelper.unscannedDevices = ScanningHelper
                      .unscannedDevices
                      .where((element) => !element.contains(widget.data[21]))
                      .toList();
                  if (!ScanningHelper.scannedDevices
                      .contains(widget.data[21])) {
                    ScanningHelper.scannedDevices.add(widget.data[21]);
                  }
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DriverStationScanStatusRoute(
                    title: "Scanned Status",
                  );
                }));
                await ScanningHelper.generateCsv(widget.data);
              },
              child: const Text(
                'Save QR Code Data',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCard(String text) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
