import express from 'express';
const router = express.Router();
import authRouter from './auth.router';

router.use('/v1', (req, res, next) => {
  next();
});
router.use('/v1/auth', authRouter);


export default router;