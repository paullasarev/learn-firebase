import 'package:flutter/material.dart'
    show
        Scaffold,
        AppBar,
        Text,
        MainAxisAlignment,
        FloatingActionButton,
        Theme,
        Icon,
        Center,
        Column,
        Icons;
import 'package:flutter/foundation.dart' show Key;
import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:flutter_firebase/src/store/types.dart' show StoreState;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show useDispatch, useSelector;

import 'package:flutter_firebase/src/services/count/actions.dart'
    show IncrementAction;
import 'package:flutter_firebase/src/services/count/selectors.dart'
    show countSelector;

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
