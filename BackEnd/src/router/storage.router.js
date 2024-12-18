import express from 'express';
const router = express.Router();
import storageController from '@/controllers/storageController';
import asyncHandler from '@/core/errorHandler';
import verifyToken from '@/middlewares/verifyToken';
import checkAdmin from '@/middlewares/checkAdmin';


router.use(asyncHandler(verifyToken));
router.use(asyncHandler(checkAdmin));
router.get('/get-types-tree', asyncHandler(storageController.getTypesTree));
router.get('/get-data-combo-product', asyncHandler(storageController.getDataComboProduct));
router.post('/add-product', asyncHandler(storageController.addProduct));
router.post('/get-products', asyncHandler(storageController.getProducts));
router.post('/delete-product', asyncHandler(storageController.deleteProduct));
router.post('/update-product', asyncHandler(storageController.updateProduct));
router.post('/get-product-import', asyncHandler(storageController.getProductImport));
router.post('/import-product', asyncHandler(storageController.importProduct));
router.get('/delete-import-data', asyncHandler(storageController.deleteImportData));
router.post('/get-storage-products', asyncHandler(storageController.getStorageProducts));
router.post('/set-product-price', asyncHandler(storageController.setProductPrice));

export default router;