import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/components/counter_view.dart';

Widget tabHomeView({String title, int count, Function onAdd, ThemeData theme}) {
  return DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.countertops)),
            Tab(icon: Icon(Icons.directions_transit)),
          ],
        ),
        title: Text(title),
      ),
      body: TabBarView(
        children: [
          counterView(count: count, theme: theme),
          Icon(Icons.directions_transit),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    ),
  );
}
