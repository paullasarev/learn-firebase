import { gql } from '@redux-requests/graphql';

export const GQL_GET_PROJECTS = 'GQL_GET_PROJECTS';
export function gqlGetProjects() {
  return {
    type: GQL_GET_PROJECTS,
    request: {
      query: gql`
      {
        projects {
          name
          description
        }
      }
    `,
    },
  } as const;
}

export type Action =
  | ReturnType<typeof gqlGetProjects>
