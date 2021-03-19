import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WatchActions {
  static final StreamController _controller = StreamController.broadcast();

  static Stream get actions => _controller.stream;

  /// should be injected in middleware list at store
  static middleware(store, action, next) {
    next(action);
    _controller.add(action);
  }
}

// class EmptyAction {
//   @override
//   String toString() => 'Empty Action';
// }

typedef Filter = bool Function(dynamic action);
typedef Handler = void Function(dynamic action);

void useActions(Filter filter, Handler handler) {
  useEffect(() {
    final subs = WatchActions.actions.where(filter).listen(handler);
    return () {
      subs.cancel();
    };
  }, []);
}
