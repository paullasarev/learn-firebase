import 'package:flutter/material.dart';
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

final makeProjectItem = (ThemeData theme) => (Project item) => Row(children: [
      textItem(theme, item.name, 1),
      textItem(theme, item.description, 2),
    ]);

Widget projectsView({ThemeData theme, List<Project> projects}) {
  return ListView(
    children: List.from(projects.map(makeProjectItem(theme))),
  );
}
