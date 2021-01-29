import React, { useContext, useEffect } from 'react';
import logo from './logo.svg';
import './App.css';
import { FirebaseContext } from './firebase/FirebaseProvider';

function App() {
  const { api } = useContext(FirebaseContext);

  useEffect(() => {
    api.filestoreLoadCollection('projects');
  }, []);

  return (
    <div  className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
