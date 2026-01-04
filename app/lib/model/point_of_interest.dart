import 'audio_guide.dart';
import 'language.dart';

enum TypeOfDestination {entrance, gallery, tower, exit}

class PointOfInterest {
  final String id;
  final int order;
  final TypeOfDestination type;
  final String image;
  final Map<Language, AudioGuide> guides;

  PointOfInterest({
    required this.id,
    required this.order,
    required this.type,
    required this.image,
    required this.guides,
  });

  factory PointOfInterest.fromJson(Map<String, dynamic> json) {
    final Map<Language, AudioGuide> guides = {};

    // Only parse guides if it exists and is a map
    if (json['guides'] != null && json['guides'] is Map<String, dynamic>) {
      (json['guides'] as Map<String, dynamic>).forEach((lang, value) {
        guides[Language.values.byName(lang)] = AudioGuide.fromJson(value);
      });
    }

    return PointOfInterest(
      id: json['id'] ?? '',
      order: json['order'] ?? 0,
      type: TypeOfDestination.values.byName(json['type'] ?? 'entrance'),
      image: json['image'] ?? '',
      guides: guides,
    );
  }
}
