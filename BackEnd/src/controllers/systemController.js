
import { BadRequestError } from "@/core/error.response";
import { OK } from "@/core/success.response";
import SystemService from "@/services/systemService";
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
const upload = multer({ storage: imageStorage }).single('image');

class SystemController{
    
  async addMenu(req, res){
    let data = req.body;
    if(data.type === 1) {
      data.parentId = null;
    }
    else data.parentId = data.parent;
    const result = await SystemService.addMenu(data);
    return new OK('Thêm menu thành công').send(res);
  }
  async getMenus(req, res){
    const result = await SystemService.getMenus();
    return new OK('Lấy danh sách menu thành công', result).send(res);
  }
  async getParentMenus(req, res){
    const result = await SystemService.getParentMenus();
    return new OK('Lấy danh sách menu cha thành công', result).send(res);
  }
  async getMenuTree(req, res){
    const result = await SystemService.getMenuTree();
    return new OK('Lấy danh sách menu theo cây thành công', result).send(res);
  }
  async addUnit(req, res){
    let data = req.body;
    const result = await SystemService.addUnit(data);
    return new OK('Thêm đơn vị thành công',result).send(res);
  }
  async getUnitList(req, res){
    const result = await SystemService.getUnitList();
    return new OK('Lấy danh sách đơn vị thành công', result).send(res);
  }
  async editUnit(req, res){
    let data = req.body;
    if(!data.id || !data.name) throw BadRequestError('Thiếu thông tin cần thiết');
    const result = await SystemService.editUnit(data);
    return new OK('Sửa đơn vị thành công', result).send(res);
  }
  async deleteUnit(req, res){
    let data = req.body;
    if(!data.id) throw BadRequestError('Thiếu thông tin cần thiết');
    const result = await SystemService.deleteUnit(data);
    return new OK('Xóa đơn vị thành công', result).send(res);
  } 
  async addCompany(req, res){
    upload(req, res, async (err) => {
      if(err)
        throw new BadRequestError(err.message);
      const data = req.body;
      if(!data.name ) throw new BadRequestError('Thiếu thông tin cần thiết');
      if(req.file) data.image = `/images/${req.file.filename}`;
      else data.image = '';
      const result = await SystemService.addCompany(data);
      return new OK('Thêm công ty thành công', result).send(res);
    });
  }
  async getCompanies(req, res){
    const result = await SystemService.getCompanies();
    return new OK('Lấy danh sách công ty thành công', result).send(res);
  }
  async editCompany(req, res){
    upload(req, res, async (err) => {
      if(err)
        throw new BadRequestError(err.message);
      const data = req.body;
      if(!data.id || !data.name ) throw new BadRequestError('Thiếu thông tin cần thiết');
      if(req.file) {
        data.image = `/images/${req.file.filename}`;
        //unlink old image
        const company = await SystemService.getCompany(data.id);
        if(company.image) {
          const fs = require('fs');
          const path = require('path');
          fs.unlinkSync(path.resolve(__dirname, '../public' + company.image));
        }
      }
      else data.image = null;
      const result = await SystemService.editCompany(data);
      return new OK('Sửa công ty thành công', result).send(res);
    });
  }
  async deleteCompany(req, res){
    const {id} = req.body;
    if(!id) throw new BadRequestError('Thiếu thông tin cần thiết');
    const company = await SystemService.deleteCompany(id);
    // unlink image if delete success
    if(company) {
      const fs = require('fs');
      const path = require('path');
      fs.unlinkSync(path.resolve(__dirname, '../public' + company));
    }
    return new OK('Xóa công ty thành công', company).send(res);
  }
}

export default new SystemController();