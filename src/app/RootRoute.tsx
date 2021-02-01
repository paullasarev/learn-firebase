import React, { FunctionComponent } from 'react';
import { Redirect, Route, Switch } from 'react-router';

import { Dashboard } from '../containers/Dashboard/Dashboard';
import { Authenticated } from '../containers/Authenticated/Authenticated';

export const RootRoute: FunctionComponent = () => {
  return (
    <Switch>
      <Authenticated>
        <Route path="/dashboard/logo">
          <Dashboard path="/dashboard/logo" />
        </Route>
        <Route path="/dashboard/projects">
          <Dashboard path="/dashboard/projects" />
        </Route>
        <Route path="/dashboard/storage">
          <Dashboard path="/dashboard/storage" />
        </Route>
        <Route>
          <Redirect to={'/dashboard/logo'} />
        </Route>
      </Authenticated>
    </Switch>
  );
};
