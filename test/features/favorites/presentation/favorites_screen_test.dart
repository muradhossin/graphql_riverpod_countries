import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_riverpod_countries/features/countries/domain/country_model.dart';
import 'package:graphql_riverpod_countries/features/countries/providers/countries_provider.dart';
import 'package:graphql_riverpod_countries/features/countries/providers/favorites_provider.dart';
import 'package:graphql_riverpod_countries/features/favorites/presentation/favorites_screen.dart';

void main() {
  testWidgets('shows message when favorites are empty', (widgetTester) async {
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          favoritesProvider.overrideWith((ref) => FavoritesNotifier()..state = {}),
          countriesProvider.overrideWith((ref) async => [
            Country(code: 'US', name: 'United States', capital: 'Washington, D.C.', emoji: '🇺🇸'),
            Country(code: 'CA', name: 'Canada', capital: 'Ottawa', emoji: '🇨🇦'),
          ])
        ],
        child: const MaterialApp(
          home: FavoritesScreen(),
        ),
      ),
    );

    await widgetTester.pump();

    expect(find.text('No favorites yet'), findsOneWidget);

  });
  
  testWidgets('show list when favorites have items', (widgetTester) async {
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          favoritesProvider.overrideWith((ref) => FavoritesNotifier()..state = {'BD'}),
          countriesProvider.overrideWith((ref) async => [
            Country(code: 'BD', name: 'Bangladesh', capital: 'Dhaka', emoji: '🇧🇩'),
            Country(code: 'US', name: 'United States', capital: 'Washington, D.C.', emoji: '🇺🇸'),
          ])
        ],
        
        child: const MaterialApp(
          home: FavoritesScreen(),
        ),
        
      )
    );
    
    await widgetTester.pump();
    
    expect(find.textContaining('Bangladesh'), findsWidgets);
  });
}