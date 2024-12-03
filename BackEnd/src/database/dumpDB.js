import knex from 'knex';
import { exec } from 'child_process';
import knexConfig from './knexfile.js';
import path from 'path';

let db, dbConfig;
if (process.env.NODE_ENV === 'production') {
  dbConfig = knexConfig['production'];
} else {
  dbConfig = knexConfig['development'];
}
db = knex(dbConfig);
const dumpPath = path.resolve(__dirname, './dump');

const dumpFile = path.resolve(
  dumpPath,
  `${dbConfig.connection.database}-${new Date()
    .toISOString()
    .replace(/:/g, '-')}.sql`,
);

const dumpCommand = `"C:\\Program Files\\MySQL\\MySQL Server 8.4\\bin\\mysqldump" --skip-lock-tables --routines --add-drop-table --disable-keys --extended-insert -u ${dbConfig.connection.user} -p${dbConfig.connection.password} ${dbConfig.connection.database} > ${dumpFile}`;

db.raw('SELECT 1')
  .then(() => {
    console.log('Connect to database successfully, start backup database');
    exec(dumpCommand, (error, stdout, stderr) => {
      if (error) {
        console.error(`exec error: ${error}`);
        return;
      }
      if (stderr) {
        console.error(`stderr: ${stderr}`);
        return;
      }
      console.log(`stdout: ${stdout}`);
    });
  })
  .catch((err) => {
    console.error('Database connection failed:', err);
  })
  .finally(() => {
    db.destroy();
  });
