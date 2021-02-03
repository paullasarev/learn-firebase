import { createStore, combineReducers, applyMiddleware } from 'redux';
import { createLogger } from 'redux-logger';
import thunkMiddleware from 'redux-thunk';
import { connectRouter, routerMiddleware } from 'connected-react-router';
import { createBrowserHistory, History } from 'history';
import { handleRequests } from '@redux-requests/core';
import { createDriver } from '@redux-requests/graphql';

import { firebase } from '../firebase/reducer';

export const history =
  createBrowserHistory();

const { requestsReducer, requestsMiddleware } = handleRequests({
  driver: createDriver({ url: 'http://localhost:4000/graphql' }),
});

export const createRootReducer = (history: History) => combineReducers({
  firebase,
  requests: requestsReducer,
  router: connectRouter(history),
});

const loggerMiddleware = createLogger({
  collapsed: true,
});

const middlewareEnhancer = applyMiddleware(loggerMiddleware, thunkMiddleware, routerMiddleware(history), ...requestsMiddleware);

export const store = createStore(createRootReducer(history), middlewareEnhancer);
