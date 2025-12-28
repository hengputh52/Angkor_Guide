import 'package:app/model/user.dart';

enum PointInTemple {entrace, gallery, tower, exit}

class PointOfInterest{
  String id;
  String templeId;
  String name;
  PointInTemple type;
  int order;

  PointOfInterest({String? pointId, required this.templeId, required this.name, required this.type, required this.order}) : id = pointId ?? uuid.v4();
}