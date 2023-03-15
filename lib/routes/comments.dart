import 'package:flutter/material.dart';
import 'package:scouting_platform/text/title.dart';

import '../main.dart';
import '../sections/comments.dart';
import '../ui/style/style.dart';

class Comments extends StatelessWidget {
  const Comments({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.primaryColor,
        resizeToAvoidBottomInset: true,
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
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: const [
              TitleStyle(
                  text: "Comments",
                  padding: EdgeInsets.only(top: 10.0, left: 18.0)),
              SizedBox(height: 20.0),
              CommentsSection(),
            ],
          ),
        ));
  }
}
