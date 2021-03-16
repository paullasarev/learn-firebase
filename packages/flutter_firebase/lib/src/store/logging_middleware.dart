import 'package:redux/redux.dart' show Store, MiddlewareClass, NextDispatcher;
// import 'package:logging/logging.dart' show Logger;
import 'dart:developer' show log;

// import 'package:flutter_firebase/src/store/try_json_encode.dart' show tryJsonEncode;

class LoggingMiddleware<State> extends MiddlewareClass<State> {
  // final Logger _logger;

  // LoggingMiddleware(): _logger = Logger('Redux Logger':);

  int count = 0;

  @override
  dynamic call(Store<State> store, dynamic action, NextDispatcher next) {
    // final prevState = store.state;
    final next2 = next(action);
    final nextState = store.state;
    // log('prev state: $prevState', name: 'redux');
    ++count;
    // log('action: $action', name: 'redux', error: tryJsonEncode(action));
    // log('next state: $count', name: 'redux', error: tryJsonEncode(nextState));
    log('action: $action', name: 'redux', error: action);
    log('next state: $count', name: 'redux', error: nextState);
    // _logger
    //   ..fine('prev state: $prevState')
    //   ..fine('action: $action')
    //   ..fine('next state: $nextState');
    return next2;
  }
}
