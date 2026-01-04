class Favorite {
  final String poiId;
  final DateTime addedAt;

  Favorite({
    required this.poiId,
    required this.addedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'poiId': poiId,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      poiId: json['poiId'],
      addedAt: DateTime.parse(json['addedAt']),
    );
  }
}