import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_riverpod_countries/features/countries/presentation/country_details_screen.dart';
import 'package:graphql_riverpod_countries/features/countries/providers/countries_provider.dart';
import 'package:graphql_riverpod_countries/features/countries/providers/favorites_provider.dart';

class CountriesListScreen extends ConsumerWidget {
  const CountriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countriesAsync = ref.watch(countriesProvider);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'search country...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()
              ),
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
          ),

          Expanded(
            child: countriesAsync.when(
              data: (_) {
                final filtered = ref.watch(filteredCountriesProvider);
                return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final country = filtered[index];
                      final favorites = ref.watch(favoritesProvider);
                      final isFavorite = favorites.contains(country.code);
                      return ListTile(
                        leading: Text(country.emoji ?? '', style: TextStyle(fontSize: 24)),
                        title: Text(country.name ?? ''),
                        subtitle: Text('Capital: ${country.capital}'),
                        trailing: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            ref.read(favoritesProvider.notifier).toggleFavorite(country.code ?? '');
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountryDetailsScreen(country: country),
                              )
                          );
                        },
                      );
                    }
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) {
                return Center(child: Text('Error: $error'));
              },

            ),
          ),
        ],
      ),

    );
  }
}