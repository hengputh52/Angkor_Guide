import 'package:uuid/uuid.dart';

const uuid = Uuid(); 

class User{
  String id;
  String fullName;

  User({String? userId,required this.fullName}): id = userId ?? uuid.v4();

  factory User.fromJson(Map<String, dynamic> json)
  {
    return User(
      userId: json['id'],
      fullName: json['fullName']);
  }
}