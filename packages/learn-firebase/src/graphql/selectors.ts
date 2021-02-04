import { getQuery } from '@redux-requests/core';
import { get } from 'lodash';

import { Project } from '../containers/Dashboard/types';
import { GQL_GET_PROJECTS } from './actions';

export const gqlGetProjectsSelector = (state: any) => {
  return get(getQuery(state, {type: GQL_GET_PROJECTS}), 'data.projects', []) as  Project[];
};
