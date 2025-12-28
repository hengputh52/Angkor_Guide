import 'package:app/model/user.dart';

class AudioGuide {
  String id;
  String title;
  String audioAsset;
  String relatedId;

  AudioGuide({String? audioId, required this.title, required this.audioAsset, required this.relatedId}) : id = audioId ?? uuid.v4();
}
