import { FunctionComponent, useCallback } from 'react';
import { TabContext, TabPanel, TabList } from '@material-ui/lab';
import { AppBar, Button, makeStyles, Paper, Tab, Toolbar } from '@material-ui/core';

import AppLogo from '../../components/AppLogo/AppLogo';
import { Projects } from '../../components/Projects/Projects';
import { FirebaseStorage } from '../../components/FirebaseStorage/FirebaseStorage';
import { AppRoutes } from '../../app/routes';
import { Project, StorageItem } from './types';
import styles from './Dashboard.module.css';

export interface DashboardViewProps {
  projects: Project[];
  storage: StorageItem[];
  path: string;
  onTab: (value: string) => void;
  onSignOut: () => void;
}

export const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
  },
  grow: {
    flexGrow: 1,
  },
}));

export const DashboardView: FunctionComponent<DashboardViewProps> = ({
  projects,
  storage,
  path,
  onTab,
  onSignOut,
}) => {
  const classes = useStyles();

  const handleChange = useCallback(
    (event, newValue) => {
      onTab(newValue);
    },
    [onTab],
  );

  return (
    <Paper className={styles.Dashboard}>
      <TabContext value={path}>
        <AppBar position="static" className={classes.root}>
          <Toolbar>
            <TabList onChange={handleChange} aria-label="Dashboard">
              <Tab label="App Logo" value={AppRoutes.DASHBOARD_LOGO.path} />
              <Tab label="Projects" value={AppRoutes.DASHBOARD_PROJECTS.path} />
              <Tab label="Storage" value={AppRoutes.DASHBOARD_STORAGE.path} />
            </TabList>
            <div className={classes.grow} />
            <Button color="inherit" onClick={onSignOut}>
              Sign Out
            </Button>
          </Toolbar>
        </AppBar>
        <TabPanel value={AppRoutes.DASHBOARD_LOGO.path} className={styles.TabPanel}>
          <AppLogo />
        </TabPanel>
        <TabPanel value={AppRoutes.DASHBOARD_PROJECTS.path} className={styles.TabPanel}>
          <Projects items={projects} />
        </TabPanel>
        <TabPanel value={AppRoutes.DASHBOARD_STORAGE.path} className={styles.TabPanel}>
          <FirebaseStorage items={storage} />
        </TabPanel>
      </TabContext>
    </Paper>
  );
};
