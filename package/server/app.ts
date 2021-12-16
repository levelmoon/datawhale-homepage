import 'reflect-metadata';
import express from 'express';
import { initDbConnection } from './db';
import { getRouter } from './router';
import { config } from './config';

const main = async () => {
  await initDbConnection();

  const app = express();
  const port = 8081;

  app.use('/datawhale-homepage', express.static(config.staticFilePath));
  // 使用getRouter是为了防止在建立dbconnection之前初始化entity
  app.use('/api', getRouter());
  app.listen(port, () => {
    console.log(`server started at http://localhost:${port}`);
  });
};

main();
