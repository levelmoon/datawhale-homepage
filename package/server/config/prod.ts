import { getPassword } from '../util/password';
import path from 'path';

export const productionConfig = {
  db: {
    type: 'mysql',
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: getPassword(path.join(__dirname, '../../password.json')),
    database: 'datawhale',
    entities: [path.join(__dirname, '../entity/**/*.js')]
  },
  staticFilePath: path.join(__dirname, '../client')
};
