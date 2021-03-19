import 'package:flutter/material.dart';

Widget counterView({int count, ThemeData theme, Function onList}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '$count',
          style: theme.textTheme.headline4,
        ),
        OutlinedButton(onPressed: onList, child: Text('Goto List'))
      ],
    ),
  );
}
