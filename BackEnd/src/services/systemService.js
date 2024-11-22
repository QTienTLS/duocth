import { BadRequestError } from '@/core/error.response';
import db from '@/database';

class SystemService{
  static async addMenu(data){
    try {
      let result = await db('menus').insert({
        p_id: data.parentId,
        name: data.name,
        url: data.url,
        icon: data.icon,
        created_at: new Date(),
      });
      return result;
    } catch (error) {
      throw new BadRequestError(error.message);
    }
  }
  static async getMenus(){
    try {
      const menus = await db.raw('SELECT get_menus() AS menus');
      return menus[0][0].menus;
    } catch (error) {
      throw new BadRequestError(error.message);
    }
  }
  static async getParentMenus(){
    try {
      const menus = await db.raw('SELECT get_parent_menus() AS menus');
      return menus[0][0].menus;
    } catch (error) {
      throw new BadRequestError(error.message);
    }
  }
  static async getMenuTree(){
    try {
      const menus = await db.raw('SELECT get_menu_tree() AS menus');
      return menus[0][0].menus;
    } catch (error) {
      throw new BadRequestError(error.message);
    }
  }
}

export default SystemService;