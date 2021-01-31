import { FunctionComponent, useCallback, useState } from 'react';
import { TabContext, TabPanel, TabList } from '@material-ui/lab';
import { AppBar, makeStyles, Paper, Tab } from '@material-ui/core';

import AppLogo from '../../components/AppLogo/AppLogo';
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

export const DashboardView: FunctionComponent<DashboardViewProps> = ({ projects }) => {
  const classes = useStyles();

  const [value, setValue] = useState('1');

  const handleChange = useCallback((event, newValue) => {
    setValue(newValue);
  }, []);

  return (
    <Paper className={styles.Dashboard}>
      <TabContext value={value}>
        <AppBar position="static" className={classes.root}>
          <TabList onChange={handleChange} aria-label="simple tabs example">
            <Tab label="App Logo" value="1" />
            <Tab label="Item Two" value="2" />
            <Tab label="Item Three" value="3" />
          </TabList>
        </AppBar>
        <TabPanel value="1" className={styles.TabPanel}>
          <AppLogo />
        </TabPanel>
        <TabPanel value="2" className={styles.TabPanel}>Item Two</TabPanel>
        <TabPanel value="3" className={styles.TabPanel}>Item Three</TabPanel>
      </TabContext>
    </Paper>
  );
};
