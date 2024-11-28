import { OK } from "@/core/success.response";
import storageService from "@/services/storageService";



class StorageController {
  async getTypesTree(req, res) {
    return new OK('Danh sách loại',await storageService.getTypesTree()).send(res);
  }
}

export default new StorageController();