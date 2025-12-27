import 'package:app/model/user.dart';

class Sculpture {
  String id;
  String title;
  String story;
  String audio;
  List<String> image;

  Sculpture({String? sculptureId, required this.title, required this.story, required this.audio, required this.image}) : id = sculptureId ?? uuid.v4();
}