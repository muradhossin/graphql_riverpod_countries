import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink('https://countries.trevorblades.com/');

GraphQLClient getGraphQLClient() {
  return GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  );
}