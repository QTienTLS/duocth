import { InternalServerError } from "@/core/error.response";
import { CREATED, OK } from "@/core/success.response";
import storageService from "@/services/storageService";
import multer from 'multer';
import path from 'path';
const imageStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.resolve(__dirname, '../public/images'));
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + '-duocth' + path.extname(file.originalname));
  }
});

const uploadFileProduct = multer({ storage: imageStorage }).fields([
  { name: 'img', maxCount: 1 },
  { name: 'img_desc', maxCount: 1 }
])
class StorageController {
  async getTypesTree(req, res) {
    return new OK('Danh sách loại',await storageService.getTypesTree()).send(res);
  }
  async getDataComboProduct(req, res) {
    return new OK('Danh sách sản phẩm',await storageService.getDataComboProduct()).send(res);
  }
  async addProduct(req, res,next) {
    uploadFileProduct(req, res, async (err) => {
      try {
        if (err) {
          throw new InternalServerError('Lỗi khi upload ảnh sản phẩm');
        }
        let data = req.body;
        if(!data.name || !data.type_id || !data.units) {
          throw new InternalServerError('Vui lòng nhập đầy đủ thông tin');
        }
        data.img = req.files.img?req.files.img[0].filename:'';
        data.img_desc = req.files.img_desc?req.files.img_desc[0].filename:'';
        const result = await storageService.addProduct(data);
        return new CREATED('Thêm sản phẩm thành công').send(res);
      } catch (error) {
        next(error);
      }
    });
  }
  async getProducts(req, res) {
    const data = req.body;
    const typeID = data.type_id?data.type_id:null;
    const name = data.name?data.name:'';
    const c_id = data.c_id?data.c_id:null;
    const d_id = data.d_id?data.d_id:null;
    return new OK('Danh sách sản phẩm',await storageService.getProducts(typeID, name, c_id, d_id)).send(res);
  }
  async deleteProduct(req, res) {
    const data = req.body;
    const id = data.id;
    await storageService.deleteProduct(id);
    return new OK('Xóa sản phẩm thành công').send(res);
  }
  async updateProduct(req, res) {
    uploadFileProduct(req, res, async (err) => {
      if (err) {
        throw new InternalServerError('Lỗi khi upload ảnh sản phẩm');
      }
      const data = req.body;
      data.img = req.files.img?req.files.img[0].filename:'';
      data.img_desc = req.files.img_desc?req.files.img_desc[0].filename:'';
      await storageService.uploadProduct(data);
      return new OK('Upload ảnh sản phẩm thành công').send(res);
    });
  }
  async getProductImport(req, res) {
    const {id} = req.body;
    if(!id) {
      throw new InternalServerError('Vui lòng nhập id sản phẩm');
    }
    return new OK('Lấy dữ liệu sản phẩm thành công',await storageService.getProductImport(id)).send(res);
  }
  async importProduct(req, res) {
    const data = req.body;
    await storageService.importProduct(data);
    return new OK('Nhập hàng thành công').send(res);
  }
  async deleteImportData(req, res) {
    await storageService.deleteImportData();
    return new OK('Xóa dữ liệu nhập hàng thành công').send(res);
  }
  async getStorageProducts(req, res) {
    const data = req.body;
    const pageNum = data.page_num||1;
    const pageSize = data.page_size||10;
    return new OK('Danh sách sản phẩm trong kho',await storageService.getStorageProducts(pageNum,pageSize)).send(res);
  }
  async setProductPrice(req, res) {
    const data = req.body;
    if(!data.product_id || !data.prices) {
      throw new InternalServerError('Vui lòng nhập đầy đủ thông tin');
    }
    await storageService.setProductPrice(data);
    return new OK('Cập nhật giá sản phẩm thành công').send(res);
  }
}


export default new StorageController();