import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/favorite.dart';

class FavoriteService extends ChangeNotifier {
  List<Favorite> _favorites = [];
  static const String _storageKey = 'favorites';

  List<Favorite> get favorites => _favorites;

  // Initialize - Load favorites from storage
  Future<void> init() async {
    await _loadFavorites();
  }

  // Check if a POI is favorited
  bool isFavorite(String poiId) {
    return _favorites.any((fav) => fav.poiId == poiId);
  }

  // Toggle favorite status
  Future<void> toggleFavorite(String poiId) async {
    if (isFavorite(poiId)) {
      await removeFavorite(poiId);
    } else {
      await addFavorite(poiId);
    }
  }

  // Add to favorites
  Future<void> addFavorite(String poiId) async {
    if (!isFavorite(poiId)) {
      _favorites.add(Favorite(
        poiId: poiId,
        addedAt: DateTime.now(),
      ));
      await _saveFavorites();
      notifyListeners();
    }
  }

  // Remove from favorites
  Future<void> removeFavorite(String poiId) async {
    _favorites.removeWhere((fav) => fav.poiId == poiId);
    await _saveFavorites();
    notifyListeners();
  }

  // Get favorite count
  int get count => _favorites.length;

  // Load favorites from SharedPreferences
  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString(_storageKey);

      if (jsonString != null) {
        final List<dynamic> jsonList = json.decode(jsonString);
        _favorites = jsonList.map((e) => Favorite.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }

  // Save favorites to SharedPreferences
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String jsonString = json.encode(
        _favorites.map((f) => f.toJson()).toList(),
      );
      await prefs.setString(_storageKey, jsonString);
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }
}