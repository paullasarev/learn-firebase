import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/material.dart' show MaterialApp, ThemeData, Colors;
import 'package:flutter/widgets.dart' show Widget, BuildContext, StatelessWidget;
import 'package:flutter_firebase/src/screens/my_home_page/my_home_page.dart';
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
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(title: 'Flutter Demo Это Home Page'),
            )));
  }
}
