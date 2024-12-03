// knexfile.js
const config = {
  development: {
    client: 'mysql2',
    connection: {
      host: '127.0.0.1',
      user: 'root',
      password: 'Maihang123',
      database: 'duocth_development'
    },
    migrations: {
      directory: './migrations'
    },
    seeds: {
      directory: './seeds'
    }
  },
  production: {
    client: 'mysql2',
    connection: {
      host: 'mindstore.io.vn',
      user: 'qtientls',
      password: 'Maihang123@',
      database: 'duocth_development'
    },
    migrations: {
      directory: './migrations'
    },
    seeds: {
      directory: './seeds'
    }
  }
};

export default config;