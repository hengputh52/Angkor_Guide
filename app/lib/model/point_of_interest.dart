import 'package:app/model/user.dart';

enum PointInTemple {entrace, gallery, tower, exit}

class PointOfInterest{
  final String id;
  final String templeId;
  final Map<String, String> name;
  final Map<String,PointInTemple> type;
  final Map<String, String> audio;

  PointOfInterest({String? pointId, required this.templeId, required this.name, required this.type,required this.audio}) : id = pointId ?? uuid.v4();

  factory PointOfInterest.fromJson(Map<String, dynamic> json)
  {
    return PointOfInterest(
      pointId: json['id'],
      templeId: json['templeId'],
      name: Map<String, String>.from(json['name']),
      type: Map<String, PointInTemple>.from(json['type']),
      audio: Map<String, String>.from(json['audio']),
      );
  }
}