import 'package:app/model/point_of_interest.dart';
import 'package:app/model/user.dart';

class TourRoute {
  final String id;
  final String templeId;
  final Map<String, String> name;
  List<String> orderedPoint;

  TourRoute({String? routeId, required this.templeId, required this.name, required this.orderedPoint}) : id = routeId ?? uuid.v4();

  factory TourRoute.fromJson(Map<String, dynamic> json)
  {
    return TourRoute(
      routeId: json['id'],
      templeId: json['templeId'],
      name: Map<String, String>.from(json['name']),
      orderedPoint: json['orderedPoint']
      );
  }
}
