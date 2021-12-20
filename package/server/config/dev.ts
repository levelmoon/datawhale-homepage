import path from 'path';

export const developmentConfig = {
  db: {
    type: 'mysql',
    host: 'localhost',
    port: 3306,
    username: 'root',
    passwordPath: path.join(__dirname, '../../../password.json'),
    database: 'datawhale',
    entities: [path.join(__dirname, '../entity/**/*.ts')]
  },
  staticFilePath: path.join(__dirname, '../../../output/client')
};
