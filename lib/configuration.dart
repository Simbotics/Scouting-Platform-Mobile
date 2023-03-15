import 'dart:convert';
import 'dart:io';

/**
 * Gets a specific key from the config file.
 */
get(String key) async {
  final configFile = File('config.json');
  final jsonString = await configFile.readAsString();
  final dynamic jsonMap = jsonDecode(jsonString);

  return jsonMap[key];
}
