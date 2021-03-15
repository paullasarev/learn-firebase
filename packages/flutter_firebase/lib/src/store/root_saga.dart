import 'package:redux_saga/redux_saga.dart' show Spawn;

import 'package:flutter_firebase/src/services/projects/saga.dart' show sagaProjects;
import 'package:flutter_firebase/src/services/graphql/saga.dart' show sagaGraphql;

rootSaga() sync* {
  yield Spawn(sagaGraphql);
  yield Spawn(sagaProjects);
}
