import { useSelector } from 'react-redux';
import { useMemo } from 'react';

export function useSelectorFactory<TSelected>(
  selectorFactory: (...args: any[]) => (state: any) => TSelected,
  ...args: any[]
) {
  // eslint-disable-next-line react-hooks/exhaustive-deps
  return useSelector(useMemo(() => selectorFactory(...args), [selectorFactory, ...args]));
}

