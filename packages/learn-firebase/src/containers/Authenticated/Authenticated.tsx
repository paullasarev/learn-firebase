import { FunctionComponent, useCallback, useContext } from 'react';
import { useSelector } from 'react-redux';

import { getAuthInfo, getSignInInProgress } from '../../firebase/reducer';
import { FirebaseContext } from '../../firebase/FirebaseProvider';
import { LoginView } from './LoginView';

export interface AuthenticatedProps {
  children: any;
}

export const Authenticated: FunctionComponent<AuthenticatedProps> = ({children}) => {
  const authInfo = useSelector(getAuthInfo);
  const inProgress = useSelector(getSignInInProgress);
  const { api } = useContext(FirebaseContext);

  const onLogin = useCallback((email: string, password: string) => {
    api.signInWithEmailPassword(email, password);
  }, [api]);

  if (authInfo.isSignedIn) {
    return children;
  }

  return (
    <LoginView onSubmit={onLogin} inProgress={inProgress}/>
  );
};
