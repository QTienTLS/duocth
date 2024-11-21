import express from 'express';
const router = express.Router();
import authRouter from './auth.router';
import systemRouter from './system.router';

router.use('/v1', (req, res, next) => {
  next();
});
router.use('/v1/auth', authRouter);
router.use('/v1/system', systemRouter);


export default router;