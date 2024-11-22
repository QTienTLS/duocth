import express from 'express';
const router = express.Router();
import systemConTroller from '@/controllers/systemController';
import asyncHandler from '@/core/errorHandler';
import verifyToken from '@/middlewares/verifyToken';
import checkAdmin from '@/middlewares/checkAdmin';

router.use(asyncHandler(verifyToken));
router.use(asyncHandler(checkAdmin));
router.post('/add-menu', asyncHandler(systemConTroller.addMenu));
router.get('/get-menus', asyncHandler(systemConTroller.getMenus));
router.get('/get-parent-menus', asyncHandler(systemConTroller.getParentMenus));
router.get('/get-menu-tree', asyncHandler(systemConTroller.getMenuTree));

export default router;