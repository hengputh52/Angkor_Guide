import 'package:app/model/user.dart';

enum PointInTemple { entrance, gallery, tower, exit }

class PointOfInterest {
  final String id;
  final String templeId;

  // Localized name
  final Map<String, String> name;

  // One type per POI
  final PointInTemple type;

  // Localized audio path
  final Map<String, String> audio;

  // Optional but very useful
  final int order; // for audio list order
  final String image;

  PointOfInterest({
    String? pointId,
    required this.templeId,
    required this.name,
    required this.type,
    required this.audio,
    required this.order,
    required this.image,
  }) : id = pointId ?? uuid.v4();

  factory PointOfInterest.fromJson(Map<String, dynamic> json) {
    return PointOfInterest(
      pointId: json['id'],
      templeId: json['templeId'],
      name: Map<String, String>.from(json['name']),
      type: PointInTemple.values.byName(json['type']),
      audio: Map<String, String>.from(json['audio']),
      order: json['order'],
      image: json['image'],
    );
  }
}
