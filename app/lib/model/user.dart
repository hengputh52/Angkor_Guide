import 'package:uuid/uuid.dart';
import 'favorite.dart';

const uuid = Uuid();

class User {
  String id;
  String firstName;
  String lastName;
  List<Favorite> favorites;

  User({
    String? userId,
    required this.firstName,
    required this.lastName,
    List<Favorite>? favorites,
  })  : id = userId ?? uuid.v4(),
        favorites = favorites ?? [];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      favorites: (json['favorites'] as List<dynamic>?)
              ?.map((f) => Favorite.fromJson(f))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'favorites': favorites.map((f) => f.toJson()).toList(),
    };
  }
}