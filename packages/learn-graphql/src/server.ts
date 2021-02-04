import express from 'express';
import { graphqlHTTP } from 'express-graphql';
import { graphql, buildSchema } from 'graphql';
// import winston from 'winston';
// import expressWinston from 'express-winston';
import morgan from 'morgan';
import cors from 'cors';

import { gcGetProjects } from './firestore';
import * as Process from 'process';

const PORT = 4000;

// Construct a schema, using GraphQL schema language
const schema = buildSchema(`
  type Project {
    name: String
    description: String
  }
  type Query {
    hello: String
    projects: [Project]!
  }
`);



// The root provides a resolver function for each API endpoint
const root = {
  hello: () => {
    return 'Hello world!';
  },
  projects: () => {
    console.log('GOOGLE_APPLICATION_CREDENTIALS', Process.env.GOOGLE_APPLICATION_CREDENTIALS)
    return gcGetProjects().then((data)=>{
      const result: any[] = [];
      data.forEach((doc) => {
        console.log(doc.data())
        result.push(doc.data());
      })
      return result;
    })
    // return [
    //   { name: 'pr1', description: 'project 1'},
    //   { name: 'pr2', description: 'project 2'},
    // ]
  }
};

// Run the GraphQL query '{ hello }' and print out the response
graphql(schema, '{ hello }', root).then((response: any) => {
  console.log(response);
});

const app = express();
app.use(cors());
app.use(morgan('combined'));
// app.use(expressWinston.logger({
//   transports: [
//     new winston.transports.Console()
//   ],
//   format: winston.format.combine(
//     winston.format.colorize(),
//     winston.format.json()
//   ),
//   colorize: true,
// }));

app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));
app.listen(PORT);
console.log(`Running a GraphQL API server at http://localhost:${PORT}/graphql`);
