import 'package:app/model/user.dart';

class Temple {
  String id;
  String name;
  String description;
  String coverImage;

  Temple({String? templeId, required this.name, required this.description, required this.coverImage}): id = templeId ?? uuid.v4();
}