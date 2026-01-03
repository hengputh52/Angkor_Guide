import 'dart:convert';
import 'package:app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<void> writeUserToPrefs(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final usersString = prefs.getString('users');
    List<dynamic> users = [];
    if (usersString != null && usersString.isNotEmpty) {
      users = json.decode(usersString);
    }
    users.add(user.toJson());
    await prefs.setString('users', json.encode(users));
  }
}