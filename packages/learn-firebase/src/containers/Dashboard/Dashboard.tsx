import { FunctionComponent, useCallback, useContext, useEffect } from 'react';

import { useRouteMatch } from 'react-router';
import { useDispatch, useSelector } from 'react-redux';
import { push } from 'connected-react-router';
import { FirebaseContext } from '../../firebase/FirebaseProvider';
import { getCollection, getStorage } from '../../firebase/reducer';
import { useSelectorFactory } from '../../hooks/useSelecorFactory';
import { gqlGetProjects } from '../../graphql/actions';
// import { gqlGetProjectsSelector } from '../../graphql/selectors';
import { useProjects } from '../../graphql/hooks';
import { DashboardView } from './DashboardView';
import { Project, StorageItem } from './types';

export interface DashboardProps {
  path: string;
}

export const Dashboard: FunctionComponent<DashboardProps> = () => {
  const { api } = useContext(FirebaseContext);
  const dispatch = useDispatch();

  const { path } = useRouteMatch();

  useEffect(() => {
    api.filestoreLoadCollection('projects');
    api.storageListFiles();
    dispatch(gqlGetProjects());
  }, [api, dispatch]);

  const onTab = useCallback(
    (path: string) => {
      dispatch(push(path));
    },
    [dispatch],
  );

  const onSignOut = useCallback(() => {
    api.signOut();
  }, [api]);

  const projects = useSelectorFactory<Project[]>(getCollection, 'projects');
  const storage = useSelectorFactory<StorageItem[]>(getStorage);
  // const gqlProjects = useSelector(gqlGetProjectsSelector);
  const gqlProjects = useProjects();

  return <DashboardView {...{ projects, gqlProjects, storage, path, onTab, onSignOut }} />;
};
