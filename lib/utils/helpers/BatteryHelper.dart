// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryHelper {
  static const platform = MethodChannel('battery_channel');

  static Future<int> getBatteryLevel() async {
    try {
      final int? result = await platform.invokeMethod<int>('getBatteryLevel');
      return result ?? -1;
    } on PlatformException {
      return -1;
    }
  }
}
