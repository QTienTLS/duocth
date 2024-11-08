import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import bodyParser from 'body-parser';
import { fileURLToPath } from 'url';
import path from 'path';
import { NotFoundError } from '@/core/error.response';
import router from './router';
import db from '@/database';

const app = express();
app.use(helmet(
  {
    crossOriginResourcePolicy: { policy: 'cross-origin' },
  }
));
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Static files
// Get the current file URL
const __filename = fileURLToPath(import.meta.url);
// Get the directory name of the current module
const __dirname = path.dirname(__filename);
app.use(express.static(path.join(__dirname,'public')));
app.use(router);

//bắt route không tồn tại
app.use((req, res, next) => {
  throw new NotFoundError('Not Found');
});


//bắt lỗi
app.use((error, req, res, next) => {
  res.status(200);
  res.json({
    code: error.statusCode || 'dth-500',
    message: error.message,
  });
});

export default app;
