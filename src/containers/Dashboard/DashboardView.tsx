import { FunctionComponent, useCallback, useState } from 'react';
import { TabContext, TabPanel, TabList } from '@material-ui/lab';
import { AppBar, makeStyles, Paper, Tab } from '@material-ui/core';

import AppLogo from '../../components/AppLogo/AppLogo';
import { Projects } from '../../components/Projects/Projects';
import { Project } from './types';
import styles from './Dashboard.module.css';

export interface DashboardViewProps {
  projects: Project[];
}

export const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
  },
}));

export enum DashboardTab {
  Logo = 'Logo',
  Projects = 'Projects',
  Storage = 'Storage',
}

export const DashboardView: FunctionComponent<DashboardViewProps> = ({ projects }) => {
  const classes = useStyles();

  const [value, setValue] = useState(DashboardTab.Logo);

  const handleChange = useCallback((event, newValue) => {
    setValue(newValue);
  }, []);

  return (
    <Paper className={styles.Dashboard}>
      <TabContext value={value}>
        <AppBar position="static" className={classes.root}>
          <TabList onChange={handleChange} aria-label="Dashboard">
            <Tab label="App Logo" value={DashboardTab.Logo} />
            <Tab label="Projects" value={DashboardTab.Projects} />
            <Tab label="Storage" value={DashboardTab.Storage} />
          </TabList>
        </AppBar>
        <TabPanel value={DashboardTab.Logo} className={styles.TabPanel}>
          <AppLogo />
        </TabPanel>
        <TabPanel value={DashboardTab.Projects} className={styles.TabPanel}>
          <Projects projects={projects}/>
        </TabPanel>
        <TabPanel value={DashboardTab.Storage} className={styles.TabPanel}>Storage</TabPanel>
      </TabContext>
    </Paper>
  );
};
