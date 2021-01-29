import { Action } from './actions';

const initialState = {
    collections: {},
};

export function firebase(state = initialState, action: Action) {
    switch (action.type) {
        default:
            return state;
    }
}
