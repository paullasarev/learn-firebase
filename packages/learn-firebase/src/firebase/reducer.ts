import { DefaultRootState } from 'react-redux';
import { pathLens, replace } from 'lodash-lens';

import { compose } from 'redux';
import {
  Action,
  FB_FILESTORE_GET_COLLECTION,
  FB_SET_AUTH_INFO, FB_SIGN_IN_ERROR,
  FB_SIGN_IN_START,
  FB_SIGN_IN_SUCCESS,
  FB_STORAGE_LIST
} from './actions';
import { AuthInfo } from './types';

export interface State {
  collections: {
    [k: string]: any;
  };
  storage: any[];
  authInfo: AuthInfo;
  signInInProgress: boolean;
}

export const initialState: State = {
  collections: {},
  storage: [],
  authInfo: {
    isSignedIn: true,
    providerId: 'none',
    user: null,
  },
  signInInProgress: true,
};

interface RootState {
  firebase: State;
}

export const getCollection = <T>(name: string) => (state: RootState) => {
  return (state.firebase.collections[name] || []) as T[];
};

export const getStorage = <T>() => (state: DefaultRootState) =>
  (state as RootState).firebase.storage as T[];

export const getAuthInfo = (state: RootState) => state.firebase.authInfo;
export const getSignInInProgress = (state: RootState) => state.firebase.signInInProgress;

const signInInProgressLens = pathLens('signInInProgress');



export function firebase(state = initialState, action: Action) {
  switch (action.type) {
    case FB_FILESTORE_GET_COLLECTION: {
      const { name, data } = action.payload;
      const lens = pathLens(['collections', name]);
      return replace(lens, data, state);
    }
    case FB_STORAGE_LIST: {
      const { data } = action.payload;
      const lens = pathLens('storage');
      return replace(lens, data, state);
    }
    case FB_SET_AUTH_INFO: {
      const { authInfo } = action.payload;
      const lens = pathLens('authInfo');
      const func: any = compose(
        replace(signInInProgressLens, false),
        replace(lens, authInfo),
      );
      return func(state);
    }
    case FB_SIGN_IN_START: {
      return replace(signInInProgressLens, true, state);
    }
    case FB_SIGN_IN_SUCCESS: {
      return replace(signInInProgressLens, false, state);
    }
    case FB_SIGN_IN_ERROR: {
      return replace(signInInProgressLens, false, state);
    }
    default:
      return state;
  }
}
