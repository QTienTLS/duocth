import express from 'express';
const router = express.Router();
import systemConTroller from '@/controllers/systemController';
import asyncHandler from '@/core/errorHandler';

router.post('/add-menu', asyncHandler(systemConTroller.addMenu));

export default router;