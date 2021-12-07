import fs from 'fs';
import path from 'path';

export const getPassword = () => {
  const passwordJSON = fs.readFileSync(path.join(__dirname, '../../../password.json')).toString();
  let password = '';
  try {
    password = JSON.parse(passwordJSON).dbPassword;
  } catch (e) {
    console.error('password.json not exist');
  }
  return password;
};
