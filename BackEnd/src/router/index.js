import express from 'express';
const router = express.Router();
import authRouter from './auth.router';
import systemRouter from './system.router';

// router.use('/v1', (req, res, next) => {
//   console.log('Middleware router');
  
//   next();
// });
router.use('/auth', authRouter);
router.use('/system', systemRouter);


export default router;