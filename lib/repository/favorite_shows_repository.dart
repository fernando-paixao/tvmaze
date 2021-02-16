import 'package:shared_preferences/shared_preferences.dart';

class FavoriteShowsRepository {
  static String keyName = "favoritesList";

  Future<List<String>> getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(keyName) ?? [];
  }

  Future<bool> _setAll(List<String> newList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(keyName, newList);
  }

  Future<bool> addOne(String newFavoriteId) async {
    List<String> all = await getAll();
    all.add(newFavoriteId);
    return await _setAll(all);
  }

  Future<bool> removeOne(String favoritIdToRemove) async {
    List<String> all = await getAll();
    all.remove(favoritIdToRemove);
    return await _setAll(all);
  }

  Future<bool> isInList(String showId) async {
    List<String> all = await getAll();
    return all.contains(showId);
  }
}
