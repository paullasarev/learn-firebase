import { Action, FB_FILESTORE_GET_COLLECTION, FB_STORAGE_LIST } from './actions';
import { DefaultRootState } from 'react-redux';

interface State {
  collections: {
    [k: string]: any;
  };
  storage: any[];
}

const initialState: State = {
  collections: {},
  storage: [],
};

interface RootState {
  firebase: State,
}

export const getCollection = <T>(name: string) => (state: RootState) => {
  return (state.firebase.collections[name] || []) as T[];
};

export const getStorage = <T>(state: DefaultRootState) => ((state as RootState).firebase.storage as T[]);
// export function getStorage<T> (state: DefaultRootState): T[] {
//   return (state as RootState).firebase.storage as T[];
// }

export function firebase(state = initialState, action: Action) {
  switch (action.type) {
    case FB_FILESTORE_GET_COLLECTION: {
      const { name, data } = action.payload;
      return {
        ...state,
        collections: {
          ...state.collections,
          [name]: data,
        },
      };
    }
    case FB_STORAGE_LIST: {
      const { data } = action.payload;
      return {
        ...state,
        storage: data,
      };
    }
    default:
      return state;
  }
}
