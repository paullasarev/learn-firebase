import 'package:flutter/widgets.dart' show runApp;
import 'package:flutter_firebase/src/app/app.dart' show MyApp;
import 'package:flutter_firebase/src/services/graphql/configure_graphql.dart' show configureGraphQl;
import 'package:flutter_firebase/src/store/configure_store.dart' show configureStore;

void main() async {
  final store = await configureStore();
  final client = await configureGraphQl();

  assert(client != null);
  runApp(MyApp(client, store));
}
