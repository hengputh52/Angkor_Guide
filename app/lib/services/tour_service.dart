import 'package:app/model/point_of_interest.dart';
import 'package:app/model/tour_route.dart';

class TourService {
  int _currentIndex = 0;
  
  PointOfInterest getCurrentPoint(List<PointOfInterest> point, TourRoute route)
  {
    return point.firstWhere((p) => p.id == route.orderedPoint[_currentIndex]);
  }

  bool hasNext(TourRoute route)
  {
    return _currentIndex < route.orderedPoint.length - 1;
  }

  void next()
  {
    _currentIndex++;
  }

  void previous()
  {
    _currentIndex--;
  }

  void reset()
  {
    _currentIndex = 0;
  }
}