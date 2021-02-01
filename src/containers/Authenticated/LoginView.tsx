import { FunctionComponent, useCallback, useState } from 'react';
import {
  Button,
  CircularProgress,
  createStyles,
  Grid,
  makeStyles,
  TextField,
  Theme,
} from '@material-ui/core';

import { useEventValue } from '../../hooks/useEventValue';

export interface LoginViewProps {
  onSubmit: (email: string, password: string) => void;
  inProgress: boolean;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      '& .MuiTextField-root': {
        margin: theme.spacing(1),
        width: 200,
      },
    },
  }),
);

export const LoginView: FunctionComponent<LoginViewProps> = ({ onSubmit, inProgress }) => {
  const classes = useStyles();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const onClick = useCallback(() => {
    onSubmit(email, password);
  }, [onSubmit, email, password]);

  const onEmailChange = useEventValue(setEmail);
  const onPasswordChange = useEventValue(setPassword);

  return (
    <form className={classes.root} noValidate autoComplete="off">
      <Grid container direction="column" justify="center" alignItems="center">
        <TextField
          required
          id="outlined-required"
          label="Required"
          variant="outlined"
          value={email}
          onChange={onEmailChange}
        />
        <TextField
          id="outlined-password-input"
          label="Password"
          type="password"
          autoComplete="current-password"
          variant="outlined"
          value={password}
          onChange={onPasswordChange}
        />
        {inProgress ? (
          <CircularProgress />
        ) : (
          <Button variant="contained" color="primary" onClick={onClick}>
            "Sign In"
          </Button>
        )}
      </Grid>
    </form>
  );
};
