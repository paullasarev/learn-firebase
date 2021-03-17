import 'package:flutter/material.dart' show Scaffold, AppBar, Text, FloatingActionButton, Icon, ThemeData, Icons;
import 'package:flutter/widgets.dart' show Widget;
import 'package:flutter_firebase/src/components/counter_view.dart';

Widget myHomePageView({String title, int count, Function onAdd, ThemeData theme}) {
  return Scaffold(
    appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      // title: Text(widget.title),
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
