import db from "@/database";


class StorageService{
  async getTypesTree(){
    const types = await db.raw('SELECT get_types_tree2() AS types');
    return types[0][0].types;
  }
  async getDataComboProduct(){
    const products = await db.raw('SELECT get_data_combo_product() AS products');
    return products[0][0].products;
  }
  async addProduct(data){
    const units = data.units.replace(/\\/g,'');
    console.log(units);
    
    const result = await db.raw(`
      CALL add_product(
        '${data.name}',
        '${data.description}',
        '${data.img}',
        '${data.img_desc}',
        '${data.company_id?data.company_id:null}',
        '${data.distributor_id?data.distributor_id:null}',
        '${data.type_id}',
        '${units}');
      `);
    return result[0][0];
  }
  async getProducts(typeID, name, c_id, d_id){
    const products = await db.raw(`
      SELECT get_products(
        ${typeID?typeID:null},
        ${name?`'${name}'`:`''`},
        1,
        ${c_id?c_id:null},
        ${d_id?d_id:null}) AS products;
    `);
    return products[0][0].products;
  }
  async deleteProduct(id){
    await db.raw(`CALL delete_product(${id})`);
  }
}

export default new StorageService();