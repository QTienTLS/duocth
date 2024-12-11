import { InternalServerError } from '@/core/error.response';
import db from '@/database';
import fs from 'fs';
import path from 'path';
class StorageService {
  async getTypesTree() {
    const types = await db.raw('SELECT get_types_tree2() AS types');
    return types[0][0].types;
  }
  async getDataComboProduct() {
    const products = await db.raw(
      'SELECT get_data_combo_product() AS products',
    );
    return products[0][0].products;
  }
  async addProduct(data) {
    try {
      const units = data.units.replace(/\\/g, '');
      const result = await db.raw(`
      CALL add_product(
        '${data.name}',
        '${data.description}',
        '${data.img}',
        '${data.img_desc}',
        ${data.company_id ? data.company_id : null},
        ${data.distributor_id ? data.distributor_id : null},
        '${data.type_id}',
        '${units}');
      `);
      return result[0][0];
    } catch (error) {
      throw new InternalServerError(error.message);
    }
  }
  async getProducts(typeID, name, c_id, d_id) {
    const products = await db.raw(`
      SELECT get_products(
        ${typeID ? typeID : null},
        ${name ? `'${name}'` : `''`},
        1,
        ${c_id ? c_id : null},
        ${d_id ? d_id : null}) AS products;
    `);
    return products[0][0].products;
  }
  async deleteProduct(id) {
    await db.raw(`CALL delete_product(${id})`);
  }
  async getProduct(id) {
    const product = await db.raw(`SELECT * FROM products WHERE id = ${id}`);
    return product[0][0];
  }
  async uploadProduct(data) {
    const units = data.units.replace(/\\/g, '');
    const oldImg = await db.raw(
      `SELECT images as img,description_image as img_desc FROM products WHERE id = ${data.id}`,
    );

    await db.raw(`
      CALL upload_product(
        ${data.id},
        '${data.name}',
        '${data.description}',
        '${data.img}',
        '${data.img_desc}',
        ${data.company_id ? data.company_id : null},
        ${data.distributor_id ? data.distributor_id : null},
        '${data.type_id}',
        '${units}');
      `);
    // if update success, remove old images
    if (data.img && oldImg[0][0].img) {
      this.unLinkImage(oldImg[0][0].img);
    }
    if (data.img_desc && oldImg[0][0].img_desc) {
      this.unLinkImage(oldImg[0][0].img_desc);
    }
  }
  async unLinkImage(img) {
    const imagePath = path.resolve(__dirname, '../public/images/' + img);
    fs.unlink(imagePath, (err) => {
      if (err) {
        console.error(err);
        return;
      }
    });
  }
  async getProductImport(id) {
    const products = await db.raw(
      `SELECT get_product_import(${id}) AS products`,
    );
    const p = products[0][0].products;
    let units = p.units;
    let fixedUnits = [];
    for (let i = 0; i < units.length; i++) {
      if (i === 0) {
        fixedUnits.push({
          id: units[i].id,
          name: units[i].name,
        });
        fixedUnits.push({
          id: units[i].to_id,
          name: units[i].to_name,
        });
      } else
        fixedUnits.push({
          id: units[i].to_id,
          name: units[i].to_name,
        });
    }
    p.units = fixedUnits;
    return p;
  }
  async importProduct(data) {
    const listImport = data.listImport.replace(/\\/g, '');
    const result = await db.raw(`
      CALL import_products(
        ${data.distributor_id},
        '${listImport}'
      );`)
  }
  async deleteImportData() {
    // await db('import_histories').truncate();
    // await db('storage').truncate();
    // await db('system_logs').delete().where('logging_type_id', 4);
  }
  async getStorageProducts(pageNum,pageSize){
    const products = await db.raw(`
      SELECT get_storage_products(
        ${pageNum},
        ${pageSize}
      ) AS products;
    `);
    return products[0][0].products;
  }
  async setProductPrice(data){
    const prices = JSON.stringify(data.prices).replace(/\\/g, '');
    // console.log(`
    //   CALL set_product_price(
    //     ${data.product_id},
    //     '${prices}',
    //   );
    // `);
    
    await db.raw(`
      CALL set_product_prices(
        ${data.product_id},
        '${prices}');
    `);
  }
}

export default new StorageService();
