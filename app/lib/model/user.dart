import 'package:uuid/uuid.dart';

const uuid = Uuid(); 

class User{
  String id;
  String firstName;
  String lastName;

  User({String? userId,required this.firstName, required this.lastName}): id = userId ?? uuid.v4();

  factory User.fromJson(Map<String, dynamic> json)
  {
    return User(
      userId: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? ''
      );
  }

  Map<String, dynamic> toJson()
  {
    return {
      'id' : id,
      'firstName' : firstName,
      'lastName' : lastName
    };
  }
}