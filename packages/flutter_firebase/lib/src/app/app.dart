import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_firebase/src/screens/my_home_page/my_home_page.dart';
// import 'package:flutter_firebase/src/screens/tab_home/tab_home.dart';
import 'dart:developer' show log;
// import 'package:beamer/beamer.dart';
import 'package:flutter_firebase/src/app/app_scaffold.dart';
import 'package:vrouter/vrouter.dart';
// import 'package:flutter_firebase/src/app/bottom_navigation_bar_widget.dart';
// import 'package:flutter_firebase/src/app/locations.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart' show StoreProvider;
import 'package:graphql_flutter/graphql_flutter.dart' show GraphQLClient, GraphQLProvider;
import 'package:redux/redux.dart' show Store;
import 'package:flutter_firebase/src/store/types.dart' show StoreState;
import 'package:flutter_firebase/src/screens/counter/counter.dart';
import 'package:flutter_firebase/src/screens/projects/projects.dart';

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  final Store<StoreState> store;
  // final _beamerKey = GlobalKey<BeamerState>();
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
        child: VRouter(
          routes: [
            VStacked(key: ValueKey('AppScaffold'), widget: AppScaffold(), subroutes: [
              VChild(path: '/counter', name: '/counter', widget: CounterPage()),
              VChild(path: '/projects', name: '/projects', widget: ProjectsPage()),
            ]),
            VRouteRedirector(
              redirectTo: '/counter',
              path: r':_(.*)',
            ),
          ],
        ),
      ),
    );
    // child: MaterialApp.router(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   routeInformationParser: BeamerRouteInformationParser(),
    //   // routerDelegate: BeamerRouterDelegate(
    //   //   beamLocations: beamLocations,
    //   // ),
    //   routerDelegate: RootRouterDelegate(
    //     homeBuilder: (context, uri) => Scaffold(
    //       body: Beamer(
    //         key: _beamerKey,
    //         beamLocations: beamLocations,
    //       ),
    //       //     bottomNavigationBar: BottomNavigationBarWidget(
    //       //         //  beamerKey: _beamerKey,
    //       //         ),
    //     ),
    //   ),
    // )));
    // child: MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: TabHomePage(title: 'Flutter Demo Это Home Page'),
    // )));
  }
}
