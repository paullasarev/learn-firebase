import { FunctionComponent, useCallback, useContext, useEffect } from 'react';

import { useRouteMatch } from 'react-router';
import { useDispatch } from 'react-redux';
import { push } from 'connected-react-router';
import { FirebaseContext } from '../../firebase/FirebaseProvider';
import { getCollection, getStorage } from '../../firebase/reducer';
import { useSelectorFactory } from '../../hooks/useSelecorFactory';
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
  }, [api]);

  const onTab = useCallback(
    (path) => {
      dispatch(push(path));
    },
    [dispatch],
  );

  const onSignOut = useCallback(() => {
    api.signOut();
  }, []);

  const projects = useSelectorFactory<Project[]>(getCollection, 'projects');
  const storage = useSelectorFactory<StorageItem[]>(getStorage);

  return <DashboardView {...{ projects, storage, path, onTab, onSignOut }} />;
};
