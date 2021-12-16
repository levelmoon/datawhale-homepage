import fs from 'fs';

export const getPassword = (filepath: string) => {
  let password = '';
  try {
    const passwordJSON = fs.readFileSync(filepath).toString();
    password = JSON.parse(passwordJSON).dbPassword;
  } catch (e) {
    console.error('password.json not exist');
  }
  return password;
};
