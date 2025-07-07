import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_riverpod_countries/features/countries/data/country_repository.dart';
import 'package:graphql_riverpod_countries/features/countries/domain/country_model.dart';

final countryRepositoryProvider = Provider((ref) => CountryRepository());

final countriesProvider = FutureProvider<List<Country>>((ref) async {
  final repo = ref.read(countryRepositoryProvider);
  return repo.fetchCountries();
});