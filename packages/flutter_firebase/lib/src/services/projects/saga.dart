import 'package:flutter_firebase/src/services/projects/types.dart' show Project;
import 'package:redux_saga/redux_saga.dart' show Put;

import 'package:flutter_firebase/src/services/projects/actions.dart' show SetProjectsAction;

sagaProjects() sync* {
  yield Put(SetProjectsAction([Project('test', 'test description')]));
  yield Put(SetProjectsAction([
    Project('test1', 'description 1'),
    Project('test2', 'description 2'),
    Project('test3', 'descr 3'),
  ]));
}
