import { gql } from '@redux-requests/graphql';

export const GQL_GET_PROJECTS = 'GQL_GET_PROJECTS';
export const GQL_GET_PROJECTS_QUERY = gql`
  {
    projects {
      name
      description
    }
  }
`;

export function gqlGetProjects() {
  return {
    type: GQL_GET_PROJECTS,
    request: {
      query: GQL_GET_PROJECTS_QUERY,
    },
  } as const;
}

export type Action =
  | ReturnType<typeof gqlGetProjects>
