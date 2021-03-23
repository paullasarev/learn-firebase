import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/components/projects_view/projects_view.dart';
import 'package:flutter_firebase/src/services/projects/selectors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';

class ProjectsPage extends HookWidget {
  ProjectsPage({Key key}) : super(key: key);

  void onList() {}

  @override
  Widget build(BuildContext context) {
    final projects = useSelector(projectsSelector);

    return projectsView(
      theme: Theme.of(context),
      projects: projects,
    );
  }
}
