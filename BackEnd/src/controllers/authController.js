
import { OK } from "@/core/success.response";
import AuthService from "@/services/authService";
class AuthController{
    async login(req, res){
        const {username, password} = req.body;
        const result = await AuthService.login(username, password);
        return new OK('Đăng nhập thành công', result).send(res);
    }

    
}

export default new AuthController();