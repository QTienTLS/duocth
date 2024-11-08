import knex from 'knex';
import knexConfig from './knexfile.js';

let db;
if(process.env.NODE_ENV === 'production') {
  db = knex(knexConfig['production']);
}
else {
  db = knex(knexConfig['development']);
}
db.raw('SELECT 1')
  .then(() => {
    console.log('Connect to database successfully');
  })
  .catch((err) => {
    console.error('Database connection failed:', err);
  });

export default db;