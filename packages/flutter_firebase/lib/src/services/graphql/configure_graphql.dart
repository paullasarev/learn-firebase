import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:graphql_flutter/graphql_flutter.dart'
    show GraphQLClient, GraphQLCache, HiveStore, initHiveForFlutter, HttpLink;

Future<ValueNotifier<GraphQLClient>> configureGraphQl() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink('http://localhost:4000/graphql');
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  return client;
}
