import express from 'express';
const router = express.Router();
import storageController from '@/controllers/storageController';
import asyncHandler from '@/core/errorHandler';
import verifyToken from '@/middlewares/verifyToken';
import checkAdmin from '@/middlewares/checkAdmin';


router.use(asyncHandler(verifyToken));
router.use(asyncHandler(checkAdmin));
router.get('/get-types-tree', asyncHandler(storageController.getTypesTree));


export default router;