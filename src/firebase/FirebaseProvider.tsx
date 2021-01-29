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
  const dispatch = useDispatch();

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
