import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_firebase/src/app/app_scaffold.dart';
import 'package:flutter_firebase/src/screens/counter/counter.dart';
import 'package:flutter_firebase/src/screens/projects/projects.dart';

class RouteInfo {
  final String path;
  final String name;
  final Widget Function() getWidget;
  RouteInfo(this.path, this.name, this.getWidget);
}

final List<RouteInfo> routesInfo = [
  RouteInfo('/counter', '/counter', () => CounterPage()),
  RouteInfo('/projects', '/projects', () => ProjectsPage()),
];

VRouteElement makeVChild(RouteInfo info) => VChild(path: info.path, name: info.name, widget: info.getWidget());

int getRouteIndex(BuildContext context) {
  final name = VRouteElementData.of(context).vChildName;
  final current = routesInfo.indexWhere((element) => element.name == name);
  return current >= 0 ? current : 0;
}

void pushRouteByIndex(BuildContext context, int index) {
  VRouterData.of(context).push(routesInfo[index].path);
}

void pushRouteByPath(BuildContext context, String path) {
  final current = routesInfo.indexWhere((element) => element.path == path);
  final index = current >= 0 ? current : 0;
  print('pushRouteByPath $path $index');
  pushRouteByIndex(context, index);
}

appRouter() {
  return VRouter(
    routes: [
      VStacked(
        key: ValueKey('AppScaffold'),
        widget: AppScaffold(),
        subroutes: List.from(routesInfo.map(makeVChild)),
      ),
      VRouteRedirector(
        redirectTo: routesInfo[0].path,
        path: r':_(.*)',
      ),
    ],
    buildTransition: (animation1, _, child) {
      // return FadeTransition(opacity: animation1, child: child);
      return ScaleTransition(scale: animation1, child: child);
    },
    transitionDuration: Duration(milliseconds: 200),
  );
}
