// import firebase from 'firebase';
import app from 'firebase/app';
import 'firebase/firestore';
import 'firebase/database';

export const firebaseConfig = {
  apiKey: 'AIzaSyB1drRja5vfJJ_iL0r_rfwSWqehTrlSRvA',
  authDomain: 'rawscript-da2a1.firebaseapp.com',
  databaseURL: 'https://rawscript-da2a1-default-rtdb.europe-west1.firebasedatabase.app',
  projectId: 'rawscript-da2a1',
  storageBucket: 'rawscript-da2a1.appspot.com',
  messagingSenderId: '1089913294511',
  appId: '1:1089913294511:web:13b619e0a3161983c40e5a',
  measurementId: 'G-DGQ523WGFN'
};

export const FirebaseApp = app.initializeApp(firebaseConfig);

