import React, { FunctionComponent, useMemo } from 'react';
import { Provider } from 'react-redux';
import { ConnectedRouter } from 'connected-react-router';
import { Redirect, Route, Switch } from 'react-router';
import classnames from 'classnames';

import { createMuiTheme, ThemeProvider, useTheme } from '@material-ui/core';
import { FirebaseProvider } from '../firebase/FirebaseProvider';

import { Dashboard } from '../containers/Dashboard/Dashboard';
import { useThemeStyles } from '../hooks/useThemeStyles';
import { history, store } from './configureStore';
import styles from './App.module.css';

export const AppTheme: FunctionComponent = ({ children }) => {
  const theme = useTheme();
  const classes = useThemeStyles();
  // eslint-disable-next-line no-console
  console.log({ theme });
  return <div className={classnames(styles.App, classes.root)}>{children}</div>;
};

export const App = () => {
  const theme = useMemo(
    () =>
      createMuiTheme({
        palette: {
          type: 'dark',
        },
      }),
    [],
  );
  return (
    <Provider store={store}>
      <FirebaseProvider>
        <ConnectedRouter history={history}>
          <ThemeProvider theme={theme}>
            <AppTheme>
              <Switch>
                <Route exact path="/">
                  <Dashboard />
                </Route>
                <Route>
                  <Redirect to={'/'} />
                </Route>
              </Switch>
            </AppTheme>
          </ThemeProvider>
        </ConnectedRouter>
      </FirebaseProvider>
    </Provider>
  );
};
