import 'package:flutter/material.dart';
import 'package:scouting_platform/main.dart';

import '../sections/teamMatchInformation.dart';
import '../ui/style/style.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            //resizeToAvoidBottomInset: false,
            body: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 4)),
                  child: Image.asset("assets/images/simbotics_logo.png",
                      height: 150),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to SimScout!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your initials',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        TeamAndMatchData.initialsController.text = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                    height: 47.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppStyle
                            .textInputColorLight, // Set the background color here
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      },
                      child: const Text(
                        'Start Scouting!',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )),
              ],
            ),
          ),
        )));
  }
}
