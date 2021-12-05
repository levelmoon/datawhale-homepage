import { config } from './config'
import path from 'path'
import { createConnection } from 'typeorm'

export const initDbConnection = async () => {
  await createConnection({
    ...config.db,
    type: 'mysql',
    entities: [path.join(__dirname, './entity/**/*.ts'), path.join(__dirname, './entity/**/*.js')],
    logging: true
  })
  console.log('init db successful');
}
