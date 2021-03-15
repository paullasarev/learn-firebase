import 'package:redux/redux.dart' show Store;
import 'package:redux_saga/redux_saga.dart'
    show applyMiddleware, createSagaMiddleware;
// import 'package:logging/logging.dart' show Logger;
import 'package:redux_dev_tools/redux_dev_tools.dart' show DevToolsStore;
import 'package:redux_remote_devtools/redux_remote_devtools.dart' show RemoteDevToolsMiddleware;

import 'package:flutter_firebase/src/store/root_saga.dart' show rootSaga;
import 'package:flutter_firebase/src/store/logging_middleware.dart'
    show LoggingMiddleware;
import 'package:flutter_firebase/src/store/types.dart' show StoreState;
import 'package:flutter_firebase/src/store/root_reducer.dart' show rootReducer;
// import 'dart:developer' show log;
import 'package:flutter_firebase/src/store/try_json_encode.dart' show tryJsonEncode;

const DEV_TOOLS_URL = 'localhost:8000';

Future<Store<StoreState>> configureStore() async {
  var remoteDevtools = RemoteDevToolsMiddleware(DEV_TOOLS_URL, stateEncoder: tryJsonEncode);
  await remoteDevtools.connect();

  final sagaMiddleware = createSagaMiddleware();

  final loggingMiddleware = LoggingMiddleware();

  // final store = Store<StoreState>(
  final store = DevToolsStore<StoreState>(
    rootReducer,
    initialState: null,
    middleware: [applyMiddleware(sagaMiddleware), /*loggingMiddleware,*/ remoteDevtools],
  );

  remoteDevtools.store = store;

  sagaMiddleware.setStore(store);
  sagaMiddleware.run(rootSaga);

  return store;
}
