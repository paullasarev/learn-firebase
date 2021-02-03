export enum AppRouteKey {
  DASHBOARD_LOGO = 'DASHBOARD_LOGO',
  DASHBOARD_PROJECTS = 'DASHBOARD_PROJECTS',
  DASHBOARD_STORAGE = 'DASHBOARD_STORAGE',
  DASHBOARD_GQL_PROJECTS = 'DASHBOARD_GQL_PROJECTS',
}

export type AppRoutesType = {
  [key in AppRouteKey]: {
    path: string;
  }
}

export const AppRoutes: AppRoutesType = {
  [AppRouteKey.DASHBOARD_LOGO]: {
    path: '/dashboard/logo'
  },
  [AppRouteKey.DASHBOARD_PROJECTS]: {
    path: '/dashboard/projects'
  },
  [AppRouteKey.DASHBOARD_GQL_PROJECTS]: {
    path: '/dashboard/gqlProjects'
  },
  [AppRouteKey.DASHBOARD_STORAGE]: {
    path: '/dashboard/storage'
  },
};

export function AppRoutePath(key: AppRouteKey) {
  return AppRoutes[key].path;
}
