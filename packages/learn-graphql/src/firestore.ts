import { Firestore } from '@google-cloud/firestore';

export const db = new Firestore({
  projectId: 'rawscript-da2a1',
  // keyFilename: '/path/to/keyfile.json',
});

export const gcGetProjects = () => db.collection('projects').get();
