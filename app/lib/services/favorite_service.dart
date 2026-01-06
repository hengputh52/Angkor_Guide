import 'package:flutter/material.dart';
import '../model/favorite.dart';
import '../services/user_service.dart';

class FavoriteService extends ChangeNotifier {
  // Check if a POI is favorited by the current user
  Future<bool> isFavorite(String poiId) async {
    final user = await UserService.getUser();
    if (user == null) return false;
    return user.favorites.any((fav) => fav.poiId == poiId);
  }

  // Toggle favorite status for the current user
  Future<void> toggleFavorite(String poiId) async {
    final user = await UserService.getUser();
    if (user == null) return;
    if (user.favorites.any((f) => f.poiId == poiId)) {
      user.favorites.removeWhere((f) => f.poiId == poiId);
    } else {
      user.favorites.add(Favorite(poiId: poiId, addedAt: DateTime.now()));
    }
    await UserService.saveUser(user);
    notifyListeners();
  }

  // Get all favorites for the current user
  Future<List<Favorite>> getFavorites() async {
    final user = await UserService.getUser();
    return user?.favorites ?? [];
  }

  // Get favorite count for the current user
  Future<int> getCount() async {
    final user = await UserService.getUser();
    return user?.favorites.length ?? 0;
  }
}