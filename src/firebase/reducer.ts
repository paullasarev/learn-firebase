import { Action, FB_FILESTORE_GET_COLLECTION } from './actions';

interface State {
  collections: {
    [k: string]: any,
  }
}

const initialState: State = {
    collections: {},
};

export const getCollection = <T>(name: string) => (state: { firebase: State }) => {
  return (state.firebase.collections[name] || []) as T[];
};

export function firebase(state = initialState, action: Action) {
    switch (action.type) {
      case FB_FILESTORE_GET_COLLECTION: {
        const { name, data } = action.payload;
        return {
          [name]: data,
          ...state,
        };
      }
      default:
        return state;
    }
}
