import 'package:flutter/material.dart';

import '../services/storage_service.dart';

class FavoritesProvider with ChangeNotifier {
  final _storage = StorageService();
  final Set<int> _favoriteIds = {};

  Set<int> get favoriteIds => {..._favoriteIds};

  Future<void> loadFavorites() async {
    final ids = await _storage.loadFavorites();
    _favoriteIds.addAll(ids);
    notifyListeners();
  }

  void toggleFavorite(int productId) {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }

    _storage.saveFavorites(_favoriteIds.toList());
    notifyListeners();
  }

  bool isFavorite(int productId) => _favoriteIds.contains(productId);
}

