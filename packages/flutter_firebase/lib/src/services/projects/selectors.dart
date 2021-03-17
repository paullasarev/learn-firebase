import 'package:flutter_firebase/src/services/projects/types.dart';
import 'package:flutter_firebase/src/store/types.dart';

List<Project> projectsSelector(StoreState state) => state.projects.projects;
