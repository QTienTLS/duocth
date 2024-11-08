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
}

export default AuthService;