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
}

export default new StorageService();