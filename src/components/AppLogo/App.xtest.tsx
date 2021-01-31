import React from 'react';
import { render, screen } from '@testing-library/react';
import AppLogo from './AppLogo';

test('renders learn react link', () => {
  render(<AppLogo />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});
