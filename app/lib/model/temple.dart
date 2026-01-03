import 'point_of_interest.dart';

class Temple {
  final String id;
  final String name;
  final String image;
  final String description;
  final List<PointOfInterest> pois;

  Temple({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.pois,
  });

  factory Temple.fromJson(Map<String, dynamic> json) {
    return Temple(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      pois: (json['pointsOfInterest'] as List)
          .map((e) => PointOfInterest.fromJson(e))
          .toList(),
    );
  }
}
