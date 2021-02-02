import { AuthInfo } from './types';

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

export const FB_SET_AUTH_INFO = 'FB_SET_AUTH_INFO';
export function fbSetAuthInfo( authInfo: AuthInfo) {
  return {
    type: FB_SET_AUTH_INFO,
    payload: {
      authInfo,
    }
  } as const;
}

export const FB_SIGN_IN_START = 'FB_SIGN_IN_START';
export function fbSignInStart(email: string) {
  return {
    type: FB_SIGN_IN_START,
    payload: {
      email,
    }
  } as const;
}

export const FB_SIGN_IN_SUCCESS = 'FB_SIGN_IN_SUCCESS';
export function fbSignInSuccess(user: any) {
  return {
    type: FB_SIGN_IN_SUCCESS,
    payload: {
      user,
    }
  } as const;
}

export const FB_SIGN_IN_ERROR = 'FB_SIGN_IN_ERROR';
export function fbSignInError(errorCode: number, errorMessage: string) {
  return {
    type: FB_SIGN_IN_ERROR,
    payload: {
      errorCode,
      errorMessage,
    }
  } as const;
}

export const FB_SIGN_OUT_SUCCESS = 'FB_SIGN_OUT_SUCCESS';
export function fbSignOutSuccess() {
  return {
    type: FB_SIGN_OUT_SUCCESS,
  } as const;
}

export type Action =
  | ReturnType<typeof fbFilestoreGetCollection>
  | ReturnType<typeof fbStorageList>
  | ReturnType<typeof fbSetAuthInfo>
  | ReturnType<typeof fbSignInSuccess>
  | ReturnType<typeof fbSignInStart>
  | ReturnType<typeof fbSignInError>
  | ReturnType<typeof fbSignOutSuccess>
;
