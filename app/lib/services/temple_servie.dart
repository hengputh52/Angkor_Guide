import 'dart:convert';
import 'package:app/model/temple.dart';
import 'package:flutter/services.dart';


class TempleService {
  static Future<List<Temple>> loadTemples() async {
    final jsonString =
        await rootBundle.loadString('assets/data/temple.json');
    final jsonData = json.decode(jsonString);

    return (jsonData['temples'] as List)
        .map((e) => Temple.fromJson(e))
        .toList();
  }
}
