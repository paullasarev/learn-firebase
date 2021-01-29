export const FB_FILESTORE_GET_COLLECTION = 'FB_FILESTORE_GET_COLLECTION';

export function fbFilestoreGetCollection(name: string, data: any) {
  return {
    type: FB_FILESTORE_GET_COLLECTION,
    payload: {
      name,
      data,
    }
  } as const;
}

export const FB_STORAGE_LIST = 'FB_STORAGE_LIST';

export function fbStorageList( data: any) {
  return {
    type: FB_STORAGE_LIST,
    payload: {
      data,
    }
  } as const;
}

export type Action =
  | ReturnType<typeof fbFilestoreGetCollection>
  | ReturnType<typeof fbStorageList>
;
