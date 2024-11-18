
import jwt from 'jsonwebtoken';

class AuthUltil{
  static async createToken(payload){
    const token = await jwt.sign(payload, process.env.JWT_SECRET, {expiresIn: '1h'});
    const refreshToken = await jwt.sign(payload, process.env.REFRESH_TOKEN_SECRET, {expiresIn: '7d'});
    return {token, refreshToken};
  }
}

export default AuthUltil;