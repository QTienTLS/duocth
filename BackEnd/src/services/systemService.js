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
  static async editMenu(data){
    try {
      let result = await db('menus').where('id', data.id).update({
        p_id: data.parentId,
        name: data.name,
        url: data.url,
        icon: data.icon,
        updated_at: new Date(),
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
  static async addUnit(data){
    if(!data.name) throw new BadRequestError('Tên đơn vị không được để trống');
    let result = await db.raw('CALL add_unit(?)', [data.name]);
    return result;
  }
  static async getUnitList(){
    try {
      const units = await db.raw('SELECT get_units() AS units');
      return units[0][0].units;
    } catch (error) {
      throw new BadRequestError(error.message);
    }
  }
  static async editUnit(data){
    const result = await db('units').where('id', data.id).update({
      name: data.name,
      updated_at: new Date(),
    });
    return result;
  }
  static async deleteUnit(data){
    const result = await db('units').where('id', data.id).update({
      active: 0,
      updated_at: new Date(),
    });
    return result;
  }
  static async addCompany(data){
    const result = await db('companies').insert({
      name: data.name,
      image: data.image,
      full_name: data.fullName,
      created_at: new Date(),
    });
    return result;
  }
  static async getCompanies(){
    try {
      const companies = await db.raw('SELECT get_companies() AS companies');
      return companies[0][0].companies;
    } catch (error) {
      throw new BadRequestError(error.message);
    }
  }
  static async editCompany(data){
    const result = await db.raw('SELECT edit_company(?,?,?,?)', [data.id, data.name,data.fullName, data.image]);
    return result;
  }
  static getCompany(id){
    return db('companies').select('*').where('id', id).first();
  }
  static async deleteCompany(id){
    const r = await db.raw('SELECT delete_company(?) as oldImage', [id]);
    return r[0][0].oldImage;
  }
  static async getDistributors(){
    return db.select('*').from('distributors').where('active', 1);
  }
  static async addDistributor(data){
    const result = await db('distributors').insert({
      name: data.name,
      fullName: data.fullName,
      created_at: new Date(),
    });
    return result;
  }
  static async editDistributor(data){
    const result = await db('distributors').where('id', data.id).update({
      name: data.name,
      fullName: data.fullName,
      updated_at: new Date(),
    });
    return result;
  }
  static async deleteDistributor(id){
    const result = await db('distributors').where('id', id).update({
      active: 0,
      updated_at: new Date(),
    });
    return result;
  }
  static async addType(data){
    const result = await db.raw('CALL add_type(?,?,?,?)', [data.name,data.level,data.parentId?data.parentId:null,data.icon]);
    return result;
  }
  static getTypes(level){
    return db.select('*').from('types').where({level: level, active: 1});
  }
  static async editType(data){
    const result = await db('types').where('id', data.id).update({
      name: data.name,
      level: data.level,
      p_id: data.parentId,
      icon: data.icon,
      updated_at: new Date(),
    });
    return result;
  }
  static async getTypesTree(){
    const types = await db.raw('SELECT get_types_tree() AS types');
    return types[0][0].types;
  }
  static async deleteType(id){
    const result = await db('types').where('id', id).update({
      active: 0,
      updated_at: new Date(),
    });
    return result;
  }
}

export default SystemService;