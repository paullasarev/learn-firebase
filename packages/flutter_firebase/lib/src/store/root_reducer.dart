import 'package:flutter_firebase/src/services/count/reducer.dart';
import 'package:flutter_firebase/src/services/projects/reducer.dart' show projectsReducer;
import 'package:flutter_firebase/src/store/types.dart' show StoreState;

// import 'dart:developer' show log;
// import 'dart:convert' show jsonEncode;

StoreState rootReducer(StoreState state, dynamic action) {
  StoreState newState = StoreState(
    projects: projectsReducer(state?.projects, action),
    count: countReducer(state?.count, action),
  );

  // log(jsonEncode(newState.projects), name: 'root');
  return newState;
}
