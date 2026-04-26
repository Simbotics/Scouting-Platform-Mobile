// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CommentValues {
  static final TextEditingController autoComments =
      TextEditingController(text: "");
  static final TextEditingController teleopComments =
      TextEditingController(text: "");
  static final TextEditingController effectiveness =
      TextEditingController(text: "0");
  static final TextEditingController aura = TextEditingController(text: "0");

  static void resetComments() {
    CommentValues.autoComments.text = "";
    CommentValues.teleopComments.text = "";
    CommentValues.effectiveness.text = "0";
    CommentValues.aura.text = "0";
  }
}
