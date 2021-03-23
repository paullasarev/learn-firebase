import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/components/counter_view/counter_view.dart';
// import 'package:flutter_firebase/src/services/count/actions.dart';
import 'package:flutter_firebase/src/services/count/selectors.dart';
// import 'package:flutter_firebase/src/store/types.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

class CounterPage extends HookWidget {
  CounterPage({Key key}) : super(key: key);

  void onList() {
    print('onList');
  }

  @override
  Widget build(BuildContext context) {
    final count = useSelector(countSelector);

    return counterView(
      theme: Theme.of(context),
      count: count,
      onList: onList,
    );
  }
}
