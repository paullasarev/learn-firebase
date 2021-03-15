import 'package:flutter_firebase/src/services/count/actions.dart';
import 'package:flutter_firebase/src/services/count/types.dart';

initialState() {
  return CountState(1);
}

CountState countReducer(CountState nstate, action) {
  CountState state = nstate ?? initialState();

  if (action is IncrementAction) {
    CountState newState = CountState(state.count + 1);
    return newState;
  }

  return state;
}
