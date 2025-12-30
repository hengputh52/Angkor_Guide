import 'package:app/model/sculpture.dart';

class SculptureService {
  final List<Sculpture> sculptures;

  SculptureService(this.sculptures);

  List<Sculpture> getByTemple(String templeId) {
    return sculptures.where((s) => s.templeId == templeId).toList();
  }

  List<Sculpture> getByPOI(String poiId) {
    return sculptures.where((s) => s.pointId == poiId).toList();
  }
}
