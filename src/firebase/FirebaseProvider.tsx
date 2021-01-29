import React, { createContext, useCallback, useMemo } from 'react';
import { useDispatch } from 'react-redux';

import { FirebaseApp } from './FirebaseApp';
import { fbFilestoreGetCollection, fbStorageList } from './actions';

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
  const storage = FirebaseApp.storage();
  const storageRef = storage.ref();

  const filestoreLoadCollection = useCallback(
    (name: string) => {
      db.collection(name)
        .get()
        .then((snapshot) => {
          const data: any[] = [];
          snapshot.forEach((doc) => {
            data.push(doc.data());
          });
          dispatch(fbFilestoreGetCollection(name, data));
        });
    },
    [db, dispatch],
  );
  const storageListFiles = useCallback(() => {
    // const listRef = storageRef.child('files/uid');
    const listRef = storageRef;
    listRef.listAll().then((list) => {
      dispatch(fbStorageList(list.items));
    });
  }, [storageRef, dispatch]);


  const firebase = useMemo(() => {
    return {
      database,
      db,
      storage,
      storageRef,
      api: {
        filestoreLoadCollection,
        storageListFiles,
      },
    };
  }, [db, database, filestoreLoadCollection]);

  return <FirebaseContext.Provider value={firebase}>{children}</FirebaseContext.Provider>;
};
