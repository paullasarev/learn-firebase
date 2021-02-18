import deepFreeze from 'deep-freeze';
import { cloneDeep } from 'lodash';

import { firebase, initialState, State } from './reducer';
import { fbFilestoreGetCollection } from './actions';

describe('CLEAN_APPOINTMENT_DETAILS', () => {
  it('should return new object', () => {
    const initState = deepFreeze(cloneDeep(initialState)) as State;
    const data = [
      {name: 'pr1', description: 'project 1'},
      {description: 'test 1', name: 'test1'},
    ];
    expect(initState.collections).toEqual({});
    const name = 'projects';
    const action = fbFilestoreGetCollection(name, data);
    const state = firebase(initState, action);
    expect(state.collections[name]).toEqual(data);
  });
});
