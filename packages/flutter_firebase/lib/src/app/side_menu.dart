import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/app/app_router.dart';

class RootDrawer {
  static DrawerControllerState of(BuildContext context) {
    final DrawerControllerState drawerControllerState = context.findRootAncestorStateOfType();
    return drawerControllerState;
  }
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = RootDrawer.of(context);
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Counter'),
            onTap: () {
              pushRouteByPath(context, '/counter');
              state.close();
            },
          ),
          ListTile(
            title: Text('Projects'),
            onTap: () {
              pushRouteByPath(context, '/projects');
              state.close();
            },
          ),
        ],
      ),
    );
  }
}
