import 'package:app/model/user.dart';

class Temple {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final List<String> coverImage;
  final String mapAsset;

  Temple({String? templeId, required this.name, required this.description, required this.coverImage, required this.mapAsset}): id = templeId ?? uuid.v4();

  factory Temple.fromJson(Map<String, dynamic> json)
  {
    return Temple(
      templeId: json['id'],
      name: Map<String, String>.from(json['name']),
      description: Map<String , String>.from(json['description']),
      coverImage: json['coverImage'],
      mapAsset: json['mapAsset']);
  }

}