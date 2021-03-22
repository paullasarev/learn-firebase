import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/components/counter_view/counter_view.dart';
import 'package:flutter_firebase/src/components/projects_view/projects_view.dart';
import 'package:flutter_firebase/src/components/side_menu/side_menu.dart';
import 'package:flutter_firebase/src/services/projects/types.dart';

class TabInfo {
  final int index;
  final String name;
  TabInfo(this.index, this.name);
}

final tabs = [
  TabInfo(0, 'Counter'),
  TabInfo(1, 'Projects'),
];

Widget tabHomeView({
  String title,
  int count,
  Function onAdd,
  Function onList,
  ThemeData theme,
  List<Project> projects,
  tabController,
}) {
  return Scaffold(
    appBar: AppBar(
      bottom: TabBar(
        controller: tabController,
        tabs: [
          Tab(icon: Icon(Icons.countertops)),
          Tab(icon: Icon(Icons.directions_transit)),
        ],
      ),
      title: Text(title),
    ),
    body: TabBarView(
      controller: tabController,
      children: [
        counterView(count: count, theme: theme, onList: onList),
        projectsView(theme: theme, projects: projects),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: onAdd,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
    drawer: SideMenu(),
  );
}
