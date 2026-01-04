import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/temple.dart';

class TempleService {
  static Future<List<Temple>> loadTemples() async {
    final jsonStr = await rootBundle.loadString('assets/data/temples.json');
    final data = json.decode(jsonStr);
    return (data['temples'] as List)
        .map((e) => Temple.fromJson(e))
        .toList();
  }
}
