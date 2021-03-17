import 'package:flutter/material.dart' show Theme;
import 'package:flutter/foundation.dart' show Key;
import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart' show useDispatch, useSelector;

import 'package:flutter_firebase/src/store/types.dart' show StoreState;
import 'package:flutter_firebase/src/services/count/selectors.dart' show countSelector;
import 'package:flutter_firebase/src/services/count/actions.dart' show IncrementAction;
import 'package:flutter_firebase/src/screens/tab_home/tab_home_view.dart' show tabHomeView;

class TabHomePage extends HookWidget {
  final String title;
  TabHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useSelector(countSelector);
    final dispatch = useDispatch<StoreState>();

    void incrementCounter() {
      dispatch(IncrementAction());
    }

    return tabHomeView(title: this.title, theme: Theme.of(context), count: count, onAdd: incrementCounter);
  }
}
