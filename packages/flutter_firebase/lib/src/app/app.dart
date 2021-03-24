import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/app/app_router.dart';
import 'dart:developer' show log;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart' show StoreProvider;
import 'package:graphql_flutter/graphql_flutter.dart' show GraphQLClient, GraphQLProvider;
import 'package:redux/redux.dart' show Store;
import 'package:flutter_firebase/src/store/types.dart' show StoreState;

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  final Store<StoreState> store;
  // final dynamic store;
  MyApp(this.client, this.store);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log(this.store.toString(), name: 'store');
    return StoreProvider(
      store: this.store,
      child: GraphQLProvider(
        client: this.client,
        child: appRouter(),
      ),
    );
    // child: MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: TabHomePage(title: 'Flutter Demo Это Home Page'),
    // )));
  }
}
