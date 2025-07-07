import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_riverpod_countries/core/graphql_client.dart';
import 'package:graphql_riverpod_countries/features/countries/domain/country_model.dart';

class CountryRepository {
  Future<List<Country>> fetchCountries() async {
    const String query = '''
      query {
        countries {
          code
          name
          capital
          emoji
        }
      }
    ''';

    final client = getGraphQLClient();
    final result = await client.query(
      QueryOptions(
        document: gql(query)
      )
    );

    if(result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List data = result.data?['countries'] ?? [];
    return data.map((e) => Country.fromJson(e)).toList();

  }
}