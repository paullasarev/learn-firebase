export interface User {
  displayName?: string;
  email: string;
  emailVerified: boolean;
  isAnonymous: boolean;
  phoneNumber?: string;
  photoURL?: string;
  refreshToken?: string;
  tenantId?: string;
  uid: string;
}

export const UserProps = [
  'displayName',
  'email',
  'emailVerified',
  'isAnonymous',
  'phoneNumber',
  'photoURL',
  'refreshToken',
  'tenantId',
  'uid',
];

export type AuthInfo = {
  isSignedIn: boolean;
  providerId: ('none' | 'google.com' | string) | null;
  user: User | null;
};

export const emptyAuthInfo: AuthInfo = {
  isSignedIn: false,
  providerId: 'none',
  user: null,
};

