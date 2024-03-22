import 'package:screen_brightness/screen_brightness.dart';

class brightnessUtils {
    // Sets the brightness of the screen
  static Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      throw 'Failed to set brightness';
    }
  }
}