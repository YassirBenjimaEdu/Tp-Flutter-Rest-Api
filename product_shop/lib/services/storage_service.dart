import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveFavorites(List<int> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'favorites',
      ids.map((id) => id.toString()).toList(),
    );
  }

  Future<List<int>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList('favorites');
    return favs?.map(int.parse).toList() ?? [];
  }
}

