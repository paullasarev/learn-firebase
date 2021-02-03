import React, { FunctionComponent } from 'react';
import { Redirect, Route, Switch } from 'react-router';

import { Dashboard } from '../containers/Dashboard/Dashboard';
import { Authenticated } from '../containers/Authenticated/Authenticated';
import { AppRouteKey, AppRoutePath } from './routes';

const pathLogo = AppRoutePath(AppRouteKey.DASHBOARD_LOGO);
const pathProjects = AppRoutePath(AppRouteKey.DASHBOARD_PROJECTS);
const pathGqlProjects = AppRoutePath(AppRouteKey.DASHBOARD_GQL_PROJECTS);
const pathStorage = AppRoutePath(AppRouteKey.DASHBOARD_STORAGE);

export const RootRoute: FunctionComponent = () => {
  return (
    <Switch>
      <Authenticated>
        <Switch>
          <Route exact path={pathLogo}>
            <Dashboard path={pathLogo} />
          </Route>
          <Route exact path={pathProjects}>
            <Dashboard path={pathProjects} />
          </Route>
          <Route exact path={pathGqlProjects}>
            <Dashboard path={pathGqlProjects} />
          </Route>
          <Route exact path={pathStorage}>
            <Dashboard path={pathStorage} />
          </Route>
          <Route>
            <Redirect to={pathLogo} />
          </Route>
        </Switch>
      </Authenticated>
    </Switch>
  );
};
