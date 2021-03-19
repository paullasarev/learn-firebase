import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:flutter_firebase/src/services/projects/types.dart';

final textItem = (ThemeData theme, String text, int flex) => Expanded(
    flex: flex,
    child: Container(
        height: 40,
        child: Center(
            child: Text(
          text,
          style: theme.textTheme.headline5,
        ))));

final makeProjectItem = (ThemeData theme) => (IndexedValue<Project> item) => Container(
      color: (item.index % 2 == 0) ? Colors.lightGreen : Colors.lightGreenAccent,
      child: Row(children: [
        textItem(theme, item.value.name, 1),
        textItem(theme, item.value.description, 2),
      ]),
    );

Widget projectsView({ThemeData theme, List<Project> projects}) {
  return ListView(
    children: List.from(
      enumerate(projects).map(makeProjectItem(theme)),
    ),
  );
}
