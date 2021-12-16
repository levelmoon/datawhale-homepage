import { config } from './config';
import { createConnection } from 'typeorm';

export const initDbConnection = async () => {
  await createConnection({
    ...config.db,
    type: 'mysql'
  });
  console.log('init db successful');
};
