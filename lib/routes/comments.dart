import 'package:flutter/material.dart';
import 'package:scouting_platform/textStyles/title.dart';
import 'package:scouting_platform/utils/data/uiUtils.dart';

import '../sections/comments.dart';
import '../ui/style/style.dart';

class Comments extends StatelessWidget {
  const Comments({Key? key, required this.title}) : super(key: key);
  final String title; // Title of the page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIUtils.getBackgroundColour(),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: AppBar(
              backgroundColor: AppStyle.textInputColor,
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Futura'),
              ),
            )),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: const [
              // Title of the comments page
              TitleStyle(
                  text: "Comments",
                  padding: EdgeInsets.only(top: 10.0, left: 18.0)),
              SizedBox(height: 20.0),
              // Input fields for comments and "Go to QR Code" button
              CommentsSection(),
            ],
          ),
        ));
  }
}
