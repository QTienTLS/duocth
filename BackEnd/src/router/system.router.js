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
router.post('/add-unit', asyncHandler(systemConTroller.addUnit));
router.get('/get-unit-list', asyncHandler(systemConTroller.getUnitList));
router.post('/edit-unit', asyncHandler(systemConTroller.editUnit));
router.post('/delete-unit', asyncHandler(systemConTroller.deleteUnit));
export default router;