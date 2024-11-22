
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
}

export default new SystemController();