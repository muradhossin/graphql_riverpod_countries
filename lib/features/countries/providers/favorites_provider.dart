import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<String>>(
  (ref) => FavoritesNotifier(),
);

class FavoritesNotifier extends StateNotifier<Set<String>> {
  FavoritesNotifier() : super({});

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
  }

}