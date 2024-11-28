import db from "@/database";


class StorageService{
  async getTypesTree(){
    const types = await db.raw('SELECT get_types_tree2() AS types');
    return types[0][0].types;
  }
}

export default new StorageService();