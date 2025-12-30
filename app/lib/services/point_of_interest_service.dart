import 'package:app/model/point_of_interest.dart';

class PointOfInterestService {
  final List<PointOfInterest> points;

  PointOfInterestService(this.points);

  List<PointOfInterest> getPOIsByTemple(String templeId) {
    return points.where((p) => p.templeId == templeId).toList();
  }

  PointOfInterest? getPOIById(String id) {
    return points.firstWhere((p) => p.id == id);
  }
}
