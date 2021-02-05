import { gql, useQuery } from '@apollo/client';
import { get } from 'lodash';

import { Project } from '../containers/Dashboard/types';

export const GQL_GET_PROJECTS_QUERY = gql`
  {
    projects {
      name
      description
    }
  }
`;

export const useProjects = () => {
  const { /*loading,*/ error, data } = useQuery(GQL_GET_PROJECTS_QUERY);
  // eslint-disable-next-line no-console
  console.log({error, data});
  return get(data, 'projects', []) as Project[];
};
