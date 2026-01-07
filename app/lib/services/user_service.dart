import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class UserService {
  static const String _usersKey = 'users';
  static const String _currentUserKey = 'current_user';

  // Save user after sign up
  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    // Load all users
    final usersJson = prefs.getString(_usersKey);
    List<User> users = [];
    if (usersJson != null) {
      users = (jsonDecode(usersJson) as List)
          .map((e) => User.fromJson(e))
          .toList();
    }
    // Remove any user with the same username
    users.removeWhere((u) => u.username == user.username);
    users.add(user);
    // Save updated users list
    await prefs.setString(_usersKey, jsonEncode(users.map((u) => u.toJson()).toList()));
    // Set as current user
    await prefs.setString(_currentUserKey, jsonEncode(user.toJson()));
  }

  // Get logged-in user
  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_currentUserKey);
    if (jsonString == null) return null;
    return User.fromJson(jsonDecode(jsonString));
  }

  // Check login
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_currentUserKey);
  }

  // Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserKey);
  }

  // Login: find user in users list and set as current user if match
  static Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString(_usersKey);
    if (usersJson == null) return false;
    final users = (jsonDecode(usersJson) as List)
        .map((e) => User.fromJson(e))
        .toList();
    User? user;
    for (var u in users) {
      if (u.username.trim() == username.trim() && u.password.trim() == password.trim()) {
        user = u;
        break;
      }
    }
    if (user == null) return false;
    // Set as current user
    await prefs.setString(_currentUserKey, jsonEncode(user.toJson()));
    return true;
  }
}
