import 'language.dart';

class AudioGuide {
  final Language language;
  final String title;
  //final String description;
  final String audioPath;

  AudioGuide({
    required this.language,
    required this.title,
    //required this.description,
    required this.audioPath,
  });

  factory AudioGuide.fromJson(String langKey, Map<String, dynamic> json) {
    return AudioGuide(
      language: Language.values.byName(langKey),
      title: json['title'],
      //description: json['description'],
      audioPath: json['audio'],
    );
  }
}
