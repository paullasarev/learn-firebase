import { makeStyles } from '@material-ui/core';

export const useThemeStyles = makeStyles((theme) => ({
  root: {
    backgroundColor: theme.palette.background.paper,
  },
}));
