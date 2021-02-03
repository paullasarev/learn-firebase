import { useCallback } from 'react';

export const useEventValue = (callback: any) => useCallback((event) => {
  callback(event?.target?.value);
}, [callback]);
