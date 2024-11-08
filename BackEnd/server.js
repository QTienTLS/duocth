// import 'module-alias/register';
import app from './src/app.js';
import net from 'net';

const BASE_PORT = process.env.PORT || 2022;

const checkPortInUse = (port, callback) => {
  const server = net.createServer();

  server.once('error', (err) => {
    if (err.code === 'EADDRINUSE') {
      callback(true);
    } else {
      callback(false, err);
    }
  });

  server.once('listening', () => {
    server.close();
    callback(false);
  });

  server.listen(port);
};

const findAvailablePort = (port, callback) => {
  checkPortInUse(port, (inUse, err) => {
    if (err) {
      console.error(`Error checking port ${port}:`, err);
      process.exit(1); // Exit the process with an error code
    } else if (inUse) {
      console.log(`Port ${port} is already in use, trying port ${port*1 + 1}`);
      findAvailablePort(port*1 + 1, callback); // Increment the port and try again
    } else {
      callback(port);
    }
  });
};

findAvailablePort(BASE_PORT, (availablePort) => {
  const server = app.listen(availablePort, () => {
    console.log(`Server running on port ${availablePort}`);
  });

  process.on('SIGINT', () => {
    server.close(() => {
      console.log('Server closed');
    });
  });
});
