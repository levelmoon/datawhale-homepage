import { config } from './config';
import { createConnection } from 'typeorm';
import { getPassword } from './util/password';

export const initDbConnection = async () => {
  await createConnection({
    ...config.db,
    password: getPassword(config.db.passwordPath),
    type: 'mysql'
  });
  console.log('init db successful');
};
