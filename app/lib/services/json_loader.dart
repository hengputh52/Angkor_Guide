import 'dart:convert';
import 'package:flutter/services.dart';

class JsonLoader {
  static Future<Map<String, dynamic>> load(String path) async {
    final data = await rootBundle.loadString(path);
    return json.decode(data);
  }
}
