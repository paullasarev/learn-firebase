import { FunctionComponent } from 'react';
import { makeStyles, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow } from '@material-ui/core';

import { StorageItem } from '../../containers/Dashboard/types';

export interface FirebaseStorageProps {
  items: StorageItem[];
}

const useStyles = makeStyles({
  table: {
    minWidth: 650,
  },
});

export const FirebaseStorage: FunctionComponent<FirebaseStorageProps> = ({items}) => {
  const classes = useStyles();

  return (
    <TableContainer component={Paper}>
      <Table className={classes.table} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Name</TableCell>
            <TableCell>Full Path</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {items.map((row) => (
            <TableRow key={row.name}>
              <TableCell component="th" scope="row">
                {row.name}
              </TableCell>
              <TableCell>{row.fullPath}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};
