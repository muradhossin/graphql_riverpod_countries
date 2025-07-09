import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_riverpod_countries/features/countries/providers/favorites_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FavoritesNotifier', () {
   late FavoritesNotifier notifier;

   setUp(() async {
     SharedPreferences.setMockInitialValues({});
     notifier = FavoritesNotifier();
     await Future.delayed(const Duration(milliseconds: 100));
   });

   test('initial state is empty', () {
    expect(notifier.state, isEmpty);
   });

   test('toggleFavorite adds and removes favorites', () async {
     notifier.toggleFavorite('BD');
     expect(notifier.state.contains('BD'), isTrue);

     notifier.toggleFavorite('BD');
     expect(notifier.state.contains('BD'), isFalse);
   });

  });
}