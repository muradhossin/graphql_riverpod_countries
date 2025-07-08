import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<String>>(
  (ref) => FavoritesNotifier(),
);

class FavoritesNotifier extends StateNotifier<Set<String>> {
  static const String _prefsKey = 'favoriteCountries';
  FavoritesNotifier() : super({}) {
    _loadFavorites();
  }

  void toggleFavorite(String countryCode) {
    if(state.contains(countryCode)) {
      final newSet = Set<String>.from(state);
      newSet.remove(countryCode);
      state = newSet;
    }else{
      final newSet = Set<String>.from(state);
      newSet.add(countryCode);
      state = newSet;
    }
    _saveFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_prefsKey) ?? [];
    state = saved.toSet();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_prefsKey, state.toList());
  }

}