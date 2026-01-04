
class AudioGuide {
  //final Language language;
  final String title;
  //final String description;
  final String audioPath;

  AudioGuide({
    
    required this.title,
    //required this.description,
    required this.audioPath,
  });

  factory AudioGuide.fromJson(Map<String, dynamic> json) {
    return AudioGuide(
      
      title: json['title'],
      //description: json['description'],
      audioPath: json['audio'],
    );
  }
}
