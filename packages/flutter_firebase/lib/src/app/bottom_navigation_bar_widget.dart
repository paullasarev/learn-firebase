import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/app/app_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomNavigationBarWidget extends HookWidget {
  BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: getRouteIndex(context),
        items: [
          BottomNavigationBarItem(label: 'Counter', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'Projtcts', icon: Icon(Icons.article)),
        ],
        onTap: (index) {
          print('onTap $index');
          pushRouteByIndex(context, index);
        });
  }
}
