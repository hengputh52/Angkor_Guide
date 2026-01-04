import 'point_of_interest.dart';
import 'language.dart';

class Temple {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final String image;
  final List<PointOfInterest> pois;

  Temple({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.pois,
  });

  factory Temple.fromJson(Map<String, dynamic> json) {
    return Temple(
      id: json['id'],
      name: Map<String, String>.from(json['name']),
      description: Map<String, String>.from(json['description']),
      image: json['image'],
      pois: (json['pointsOfInterest'] as List)
          .map((e) => PointOfInterest.fromJson(e))
          .toList(),
    );
  }

  
  String getName(Language lang) {
    return name[lang.code] ?? name['en']!;
  }

  String getDescription(Language lang) {
    return description[lang.code] ?? description['en']!;
  }
}
