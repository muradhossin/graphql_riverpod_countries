import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_riverpod_countries/features/countries/presentation/country_details_screen.dart';
import 'package:graphql_riverpod_countries/features/countries/providers/countries_provider.dart';

class CountriesListScreen extends ConsumerWidget {
  const CountriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countriesAsync = ref.watch(countriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
      ),
      body: countriesAsync.when(
        data: (countries) => ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            final country = countries[index];
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
          }
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return Center(child: Text('Error: $error'));
        },

      ),

    );
  }
}