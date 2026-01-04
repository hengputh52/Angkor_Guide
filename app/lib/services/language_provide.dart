import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/language.dart';

class LanguageProvider extends ChangeNotifier {
  static const _key = 'app_language';

  Language _current = Language.en;

  Language get current => _current;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_key);

    if (saved != null) {
      _current = Language.values.firstWhere(
        (e) => e.code == saved,
        orElse: () => Language.en,
      );
    }
    notifyListeners();
  }

  Future<void> set(Language lang) async {
    _current = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, lang.code);
    notifyListeners();
  }
}
