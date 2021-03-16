import 'package:flutter/material.dart' show Theme;
import 'package:flutter/foundation.dart' show Key;
import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart' show useDispatch, useSelector;

// import 'package:flutter_firebase/src/services/count/actions.dart'
//     show IncrementAction;
import 'package:flutter_firebase/src/store/types.dart' show StoreState;
import 'package:flutter_firebase/src/services/count/selectors.dart' show countSelector;
import 'package:flutter_firebase/src/screens/my_home_page/my_home_page_view.dart' show myHomePageView;
import 'package:flutter_firebase/src/services/count/actions.dart' show IncrementAction;

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

    void incrementCounter() {
      dispatch(IncrementAction());
    }

    return myHomePageView(title: this.title, themeData: Theme.of(context), count: count, onClick: incrementCounter);
  }
}
