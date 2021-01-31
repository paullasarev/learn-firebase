import { createStore, combineReducers, applyMiddleware } from 'redux';
import { createLogger } from 'redux-logger';
import thunkMiddleware from 'redux-thunk';
import { connectRouter, routerMiddleware } from 'connected-react-router';
import { createBrowserHistory, History } from 'history';

import { firebase } from '../firebase/reducer';

export const history = createBrowserHistory();

export const createRootReducer = (history: History) => combineReducers({
  firebase,
  router: connectRouter(history),
});

const loggerMiddleware = createLogger({
  collapsed: true,
});

const middlewareEnhancer = applyMiddleware(loggerMiddleware, thunkMiddleware, routerMiddleware(history));

export const store = createStore(createRootReducer(history), middlewareEnhancer);
