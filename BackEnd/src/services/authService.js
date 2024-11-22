import { NotFoundError } from '@/core/error.response';
import db from '@/database';
import AuthUltil from '@/ultils/auth';


class AuthService {
  static async login(username, password) {
    if(!username || !password)
      throw new NotFoundError('Vui lòng nhập đầy đủ thông tin');
    const user = await db('users').select('*').where('username', username).first();
    if(!user)
      throw new NotFoundError('Không tìm thấy tài khoản');
    const check = await Bun.password.verify(password, user.password);
    if(!check)
      throw new NotFoundError('Sai thông tin đăng nhập. Vui lòng thử lại sau!');
    const {token, refreshToken} = await AuthUltil.createToken({id: user.id});
    return {token, refreshToken, username: user.username};
  }
  static async getUserInfo(id){
    let user = await db.raw('SELECT get_user_info(?) AS user_info', [id]);
    user = user[0][0].user_info;
    if(!user)
      throw new NotFoundError('Không tìm thấy tài khoản');
    return user;
  }
  static async refreshToken(token){
    if(!token)
      throw new NotFoundError('Không tìm thấy refreshToken');
    const decoded = await AuthUltil.decodeToken(token,'duocth-refresh');
    const id = decoded.id;
    if(!id)
      throw new NotFoundError('Token không hợp lệ');
    const user = await AuthService.getUserInfo(id);
    if(!user)
      throw new NotFoundError('Không tìm thấy thông tin user');
    const {token: newToken,refreshToken: newRefreshToken} = await AuthUltil.createToken({id: user.id});
    return {token: newToken, refreshToken: newRefreshToken, username: user.username};
  }
}

export default AuthService;