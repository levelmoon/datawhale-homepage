import { getPassword } from "../util/password";

export const productionConfig = {
  db: {
    type: 'mysql',
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: getPassword(),
    database: 'datawhale',
  },
}
