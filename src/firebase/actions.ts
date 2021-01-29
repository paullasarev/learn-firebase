export const FIREBASE_GET_COLLECTION = 'FIREBASE_GET_COLLECTION';

export function firebaseGetCollection(name: string, data: any) {
  return {
    type: FIREBASE_GET_COLLECTION,
    payload: {
      name,
      data,
    }
  } as const;
}

export type Action = ReturnType<typeof firebaseGetCollection>;
