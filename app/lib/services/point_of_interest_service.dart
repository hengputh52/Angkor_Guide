import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/point_of_interest.dart';

class PoiService {
  static Future<List<PointOfInterest>> loadPOIs() async {
    final jsonString =
        await rootBundle.loadString('assets/data/point_of_interest.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList
        .map((json) => PointOfInterest.fromJson(json))
        .toList();
  }
}
