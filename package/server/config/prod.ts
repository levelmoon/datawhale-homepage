import path from 'path';

export const productionConfig = {
  db: {
    type: 'mysql',
    host: 'rm-bp149d70aowb5164y0o.mysql.rds.aliyuncs.com',
    port: 3306,
    username: 'datawhale',
    passwordPath: path.join(__dirname, '../../password.json'),
    database: 'datawhale_homepage',
    entities: [path.join(__dirname, '../entity/**/*.js')]
  },
  staticFilePath: path.join(__dirname, '../client')
};
