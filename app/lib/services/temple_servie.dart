import 'package:app/model/temple.dart';

class TempleServie {
  final List<Temple> temples;
  TempleServie(this.temples);

  List<Temple> getAllTemples()
  {
    return temples;
  }

  Temple? getTempleById(String id)
  {
    return temples.firstWhere((temple) => temple.id == id);
  }
}