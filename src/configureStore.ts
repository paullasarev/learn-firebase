import { createStore, combineReducers, applyMiddleware } from 'redux';
import { createLogger } from 'redux-logger';
import thunkMiddleware from 'redux-thunk';

import { firebase } from './firebase/reducer';

export const rootReducer = combineReducers({
  firebase,
});

const loggerMiddleware = createLogger({
  collapsed: true,
});

const middlewareEnhancer = applyMiddleware(loggerMiddleware, thunkMiddleware);

export const store = createStore(rootReducer, middlewareEnhancer);
