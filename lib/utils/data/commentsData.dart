// ignore_for_file: file_names
import 'package:flutter/widgets.dart';

/// ALL VALUES IN THIS CLASS SHOULD BE UPDATED/SET WITH SETSTATE

class CommentsData {
  // Tracks current comments inputted
  static final TextEditingController autoCommentsController =
      TextEditingController(text: "");
  static final TextEditingController preferenceCommentsController =
      TextEditingController(text: "");
  static final TextEditingController otherCommentsController =
      TextEditingController(text: "");
}
