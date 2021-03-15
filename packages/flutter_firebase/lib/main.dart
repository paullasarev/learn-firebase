import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/services/count/actions.dart';
import 'package:flutter_firebase/src/services/count/selectors.dart';
import 'dart:developer' show log;
import 'package:graphql_flutter/graphql_flutter.dart'
    show
        GraphQLClient,
        GraphQLCache,
        HiveStore,
        initHiveForFlutter,
        HttpLink,
        GraphQLProvider;

import 'package:flutter_firebase/src/store/configure_store.dart'
    show configureStore;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show useDispatch, useSelector, StoreProvider;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:redux/redux.dart' show Store;
import 'package:flutter_firebase/src/store/types.dart' show StoreState;

void main() async {
  await initHiveForFlutter();
  final store = await configureStore();
  final HttpLink httpLink = HttpLink(
      // 'https://api.github.com/graphql',
      'http://localhost:4000/graphql');
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
  assert(client != null);
  runApp(MyApp(client, store));
}

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

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
class MyHomePage extends HookWidget {
  // int _counter = 0;
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  // void _incrementCounter() {
  //   // log('counter ${_counter}\n');
  //   dispatch(IncrementAction());
  //   // setState(() {
  //   //   // This call to setState tells the Flutter framework that something has
  //   //   // changed in this State, which causes it to rerun the build method below
  //   //   // so that the display can reflect the updated values. If we changed
  //   //   // _counter without calling setState(), then the build method would not be
  //   //   // called again, and so nothing would appear to happen.
  //   //   _counter++;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final count = useSelector(countSelector);
    // final count = 0;
    final dispatch = useDispatch<StoreState>();
    // final dispatch = (dynamic action) => {};

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title),
        title: Text(this.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => dispatch(IncrementAction()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
