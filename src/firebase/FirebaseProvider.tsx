import React, { createContext, useCallback, useMemo } from 'react';
import { useDispatch } from 'react-redux';

import { FirebaseApp } from './FirebaseApp';
import { firebaseGetCollection } from './actions';

const FirebaseContext = createContext({
  db: {} as any,
  database: {} as any,
  api: {} as any,
});

export { FirebaseContext };

export const FirebaseProvider  = ({ children }: { children: any }) => {
  // let firebase = {
  //   app: null,
  //   database: null
  // }

  const dispatch = useDispatch();

  // check if firebase app has been initialized previously
  // if not, initialize with the config we saved earlier
  // if (!app.apps.length) {
  //   app.initializeApp(firebaseConfig);
  //   firebase = {
  //     app: FirebaseApp,
  //     database: FirebaseApp.database(),
  //
  //     api: {
  //       getTodos
  //     }
  //   }
  // }

  const db = FirebaseApp.firestore();
  const database = FirebaseApp.database();
  const filestoreLoadCollection = useCallback(
    (name: string) => {
      db.collection(name)
        .get()
        .then((snapshot) => {
          const data: any[] = [];
          snapshot.forEach((doc) => {
            data.push(doc.data());
          });
          dispatch(firebaseGetCollection(name, data));
        });
    },
    [db, dispatch],
  );

  const firebase = useMemo(() => {
    return {
      database,
      db,
      api: {
        filestoreLoadCollection,
      },
    };
  }, [db, database, filestoreLoadCollection]);

  return <FirebaseContext.Provider value={firebase}>{children}</FirebaseContext.Provider>;
};
