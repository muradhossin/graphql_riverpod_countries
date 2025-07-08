import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_riverpod_countries/features/countries/presentation/country_details_screen.dart';
import 'package:graphql_riverpod_countries/features/countries/providers/countries_provider.dart';
import 'package:graphql_riverpod_countries/features/countries/providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countriesAsync = ref.watch(countriesProvider);
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      body: countriesAsync.when(
        data: (countries) {
          final favoriteCountries = countries.where(
            (country) => favorites.contains(country.code)).toList();

          if(favoriteCountries.isEmpty){
            return Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
            itemCount: favoriteCountries.length,
            itemBuilder: (context, index) {
              final country = favoriteCountries[index];
              return ListTile(
                leading: Text(country.emoji, style: TextStyle(fontSize: 24)),
                title: Text(country.name),
                subtitle: Text('Capital: ${country.capital}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryDetailsScreen(country: country),
                      )
                  );
                },
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return Center(child: Text('Error: $error'));
        },
      ),
    );
  }
}
