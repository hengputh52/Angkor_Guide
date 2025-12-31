
import 'package:app/model/user.dart';

class Sculpture {
  final String id;
  final String templeId;
  final String pointId;
  final Map<String, String> title;
  final Map<String, String> story;
  final List<String> image;

  Sculpture({String? sculptureId, required this.templeId, required this.pointId, required this.title, required this.story, required this.image}) : id = sculptureId ?? uuid.v4();

  factory Sculpture.fromJson(Map<String, dynamic> json)
  {
    return Sculpture(
      sculptureId: json['id'],
      templeId: json['templeId'],
      pointId: json['pointId'],
      title: Map<String, String>.from(json['title']),
      story: Map<String, String>.from(json['story']),
      image: json['image']);
  }
}