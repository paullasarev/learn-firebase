import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_firebase/src/app/locations.dart';
// import 'package:beamer/beamer.dart';
import 'package:vrouter/vrouter.dart';

final _routes = [
  '/counter',
  '/projects',
];

int _getCurrentIndex(BuildContext context) {
  final name = VRouteElementData.of(context).vChildName;
  var current = _routes.indexOf(name);
  return current >= 0 ? current : 0;
}

class BottomNavigationBarWidget extends HookWidget {
  BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final currentIndex = useState(0);

    return BottomNavigationBar(
        // currentIndex: currentIndex.value,
        currentIndex: _getCurrentIndex(context),
        items: [
          BottomNavigationBarItem(label: 'Counter', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'Projtcts', icon: Icon(Icons.article)),
        ],
        onTap: (index) {
          print('onTap $index');
          // currentIndex.value = index;
          VRouterData.of(context).push(_routes[index]);
        });
  }
}
