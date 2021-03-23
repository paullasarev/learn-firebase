import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/screens/counter/counter.dart';
import 'package:flutter_firebase/src/screens/projects/projects.dart';

class CounterLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/counter'];

  @override
  List<BeamPage> pagesBuilder(BuildContext context) => [
        BeamPage(
          key: ValueKey('counter'),
          child: CounterPage(),
        ),
      ];
}

class ProjectsLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/projects'];

  @override
  List<BeamPage> pagesBuilder(BuildContext context) => [
        BeamPage(
          key: ValueKey('projects'),
          child: ProjectsPage(),
        ),
      ];
}

final List<BeamLocation> beamLocations = [
  CounterLocation(),
  ProjectsLocation(),
];
