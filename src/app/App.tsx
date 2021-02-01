import React, { FunctionComponent, useMemo } from 'react';
import { Provider } from 'react-redux';
import { ConnectedRouter } from 'connected-react-router';
import classnames from 'classnames';

import { createMuiTheme, ThemeProvider, useTheme } from '@material-ui/core';
import { FirebaseProvider } from '../firebase/FirebaseProvider';

import { useThemeStyles } from '../hooks/useThemeStyles';
import { history, store } from './configureStore';
import styles from './App.module.css';
import { RootRoute } from './RootRoute';

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
              <RootRoute />
            </AppTheme>
          </ThemeProvider>
        </ConnectedRouter>
      </FirebaseProvider>
    </Provider>
  );
};
