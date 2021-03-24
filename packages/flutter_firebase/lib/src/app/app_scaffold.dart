import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

import 'package:flutter_firebase/src/app/actions.dart';
import 'package:flutter_firebase/src/app/app_router.dart';
import 'package:flutter_firebase/src/app/bottom_navigation_bar_widget.dart';
import 'package:flutter_firebase/src/app/side_menu.dart';
import 'package:flutter_firebase/src/services/count/actions.dart';
import 'package:flutter_firebase/src/store/types.dart';
import 'package:flutter_firebase/src/store/watch_actions/watch_actions.dart';

class AppScaffold extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final dispatch = useDispatch<StoreState>();

    useActions((action) => action is PushRouteAction, (action) {
      // print('action $action');
      pushRouteByPath(context, action.path);
    });

    void incrementCounter() {
      dispatch(IncrementAction());
    }

    return Scaffold(
      appBar: AppBar(title: Text('App')),
      // HERE we access the vChild
      body: VRouteElementData.of(context).vChild,
      bottomNavigationBar: BottomNavigationBarWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: SideMenu(),
    );
  }
}
