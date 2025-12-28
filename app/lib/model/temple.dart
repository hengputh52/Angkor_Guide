import 'package:app/model/sculpture.dart';
import 'package:app/model/user.dart';

class Temple {
  String id;
  String name;
  String description;
  String coverImage;
  List<Sculpture> sculptures;

  Temple({String? templeId, required this.name, required this.description, required this.coverImage, required this.sculptures}): id = templeId ?? uuid.v4();
}