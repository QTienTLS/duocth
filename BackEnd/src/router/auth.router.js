import express from 'express';
const router = express.Router();
import authController from '@/controllers/authController';
import asyncHandler from '@/core/errorHandler';

router.post('/login', asyncHandler(authController.login));
router.post('/refresh-token', asyncHandler(authController.refreshToken));

export default router;