import 'package:flutter/material.dart' show Scaffold, AppBar, Text, FloatingActionButton, Icon, ThemeData, Icons;
import 'package:flutter/widgets.dart' show Widget;
import 'package:flutter_firebase/src/components/counter_view/counter_view.dart';

Widget myHomePageView({String title, int count, Function onAdd, ThemeData theme}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: counterView(count: count, theme: theme),
    floatingActionButton: FloatingActionButton(
      onPressed: onAdd,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
  );
}
