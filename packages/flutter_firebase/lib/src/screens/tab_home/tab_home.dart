import 'package:flutter/material.dart' show Theme;
import 'package:flutter/foundation.dart' show Key;
import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:flutter_firebase/src/services/projects/selectors.dart';
import 'package:flutter_firebase/src/store/watch_actions/watch_actions.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

import 'package:flutter_firebase/src/store/types.dart' show StoreState;
import 'package:flutter_firebase/src/services/count/selectors.dart' show countSelector;
import 'package:flutter_firebase/src/services/count/actions.dart' show IncrementAction, GotoListAction;
import 'package:flutter_firebase/src/screens/tab_home/tab_home_view.dart' show tabHomeView;

final isGoto = (dynamic action) => action is GotoListAction;

class TabHomePage extends HookWidget {
  final String title;
  TabHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useSelector(countSelector);
    final dispatch = useDispatch<StoreState>();
    final projects = useSelector(projectsSelector);
    final tabController = useTabController(initialLength: 2, initialIndex: 0);

    void incrementCounter() {
      dispatch(IncrementAction());
    }

    void gotoList() {
      dispatch(GotoListAction());
    }

    useActions((action) => action is GotoListAction, (action) {
      print('action $action');
      tabController.index = 1;
    });

    return tabHomeView(
      title: this.title,
      theme: Theme.of(context),
      count: count,
      onAdd: incrementCounter,
      onList: gotoList,
      projects: projects,
      tabController: tabController,
    );
  }
}
