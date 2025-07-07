import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_riverpod_countries/features/countries/data/country_repository.dart';
import 'package:graphql_riverpod_countries/features/countries/domain/country_model.dart';

final countryRepositoryProvider = Provider((ref) => CountryRepository());

final countriesProvider = FutureProvider<List<Country>>((ref) async {
  final repo = ref.read(countryRepositoryProvider);
  return repo.fetchCountries();
});


final searchQueryProvider = StateProvider<String>((ref) => '');
final filteredCountriesProvider = Provider<List<Country>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final countriesAsync = ref.watch(countriesProvider);
  
  return countriesAsync.maybeWhen(
    data: (countries) {
      if(query.isEmpty) return countries;
      return countries.where((country) => country.name.toLowerCase().contains(query)).toList();
    },
    orElse: () => [],
  );
});