import { useContext, useEffect } from 'react';

import { FirebaseContext } from '../../firebase/FirebaseProvider';
import { getCollection } from '../../firebase/reducer';
import { useSelectorFactory } from '../../hooks/useSelecorFactory';
import { DashboardView } from './DashboardView';
import { Project } from './types';

export const Dashboard = () => {
  const { api } = useContext(FirebaseContext);

  useEffect(() => {
    api.filestoreLoadCollection('projects');
    api.storageListFiles();
  }, [api]);

  const projects = useSelectorFactory<Project[]>(getCollection, 'projects');

  return (
    <DashboardView {...{projects}}/>
  );
};
