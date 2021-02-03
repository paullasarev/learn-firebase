import React, { createContext, useCallback, useEffect, useMemo } from 'react';
import { useDispatch } from 'react-redux';
import { map, get, pick } from 'lodash';

import firebase from 'firebase';
import { FirebaseApp } from './FirebaseApp';
import {
  fbFilestoreGetCollection,
  fbSetAuthInfo,
  fbSignInError, fbSignInStart,
  fbSignInSuccess, fbSignOutSuccess,
  fbStorageList
} from './actions';
import { AuthInfo, emptyAuthInfo, User, UserProps } from './types';

type UserCredential = firebase.auth.UserCredential;
type ListResult = firebase.storage.ListResult;

const FirebaseContext = createContext({
  // db: {} as any,
  // database: {} as any,
  api: {} as any,
  // auth: {} as any,
});

export { FirebaseContext };

function makeUser(user: any): User {
  return pick(user, UserProps) as User;
}

export const FirebaseProvider = ({ children }: { children: any }) => {
  const dispatch = useDispatch();

  const db = FirebaseApp.firestore();
  // const database = FirebaseApp.database();
  const storage = FirebaseApp.storage();
  const storageRef = storage.ref();
  const auth = FirebaseApp.auth();

  useEffect(() => {
    auth.onAuthStateChanged((user: any) => {
      let authInfo: AuthInfo = emptyAuthInfo;
      if (user === null) {
      } else if (user.isAnonymous === true) {
        authInfo = {
          isSignedIn: true,
          providerId: 'anonymous',
          user: makeUser(user),
        };
      } else if (user.providerData && user.providerData[0]) {
        authInfo = {
          isSignedIn: true,
          providerId: get(user, 'providerData.0.providerId', 'unknown'),
          user: makeUser(user),
        };
      }
      dispatch(fbSetAuthInfo(authInfo));
    });
  }, [dispatch, auth]);

  const filestoreLoadCollection = useCallback(
    (name: string) => {
      db.collection(name)
        .get()
        .then((snapshot: { forEach: (arg0: (doc: any) => void) => void; }) => {
          const data: object[] = [];
          snapshot.forEach((doc) => {
            data.push(doc.data() as any);
          });
          dispatch(fbFilestoreGetCollection(name, data));
        });
    },
    [db, dispatch],
  );
  const storageListFiles = useCallback(() => {
    const listRef = storageRef;
    listRef.listAll().then((list: ListResult) => {
      dispatch(fbStorageList(map(list.items, ({ name, fullPath }) => ({ name, fullPath }))));
    });
  }, [storageRef, dispatch]);

  const signInWithEmailPassword = useCallback( (email: string, password: string) => {
    dispatch(fbSignInStart(email));
    auth.signInWithEmailAndPassword(email, password)
      .then((userCredential: UserCredential) => {
        const user = userCredential.user;
        dispatch(fbSignInSuccess(user));
      })
      .catch(({errorCode, errorMessage}: { errorCode: number, errorMessage: string }) => {
        dispatch(fbSignInError(errorCode, errorMessage));
      });
  }, [dispatch, auth]);

  const signOut = useCallback(() => {
    auth.signOut()
    .then(() => {
      dispatch(fbSignOutSuccess());
    });
  }, [dispatch, auth]);

  const firebaseContextValue = useMemo(() => {
    return {
      api: {
        filestoreLoadCollection,
        storageListFiles,
        signInWithEmailPassword,
        signOut,
      },
    };
  }, [filestoreLoadCollection, storageListFiles, signInWithEmailPassword, signOut]);

  return (
    <FirebaseContext.Provider value={firebaseContextValue}>{children}</FirebaseContext.Provider>
  );
};
