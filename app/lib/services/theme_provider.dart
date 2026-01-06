import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  static const String _storageKey = 'isDarkMode';

  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isDarkMode = prefs.getBool(_storageKey) ?? false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading theme: $e');
    }
  }

  Future<void> setDarkMode(bool value) async {
    _isDarkMode = value;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_storageKey, value);
    } catch (e) {
      debugPrint('Error saving theme: $e');
    }
    notifyListeners();
  }

  Future<void> toggle() async {
    await setDarkMode(!_isDarkMode);
  }
}