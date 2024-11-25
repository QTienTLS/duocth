
import { OK } from "@/core/success.response";
import SystemService from "@/services/systemService";

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
}

export default new SystemController();