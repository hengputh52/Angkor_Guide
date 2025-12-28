import 'package:app/model/point_of_interest.dart';
import 'package:app/model/user.dart';

class TourRoute {
  String id;
  String templeId;
  String name;
  List<PointOfInterest> orderedPointId;

  TourRoute({String? routeId, required this.templeId, required this.name, required this.orderedPointId}) : id = routeId ?? uuid.v4();
}
