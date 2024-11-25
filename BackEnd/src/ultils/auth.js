
import jwt from 'jsonwebtoken';

class AuthUltil{
  static async createToken(payload){
    const token = await jwt.sign(payload, process.env.JWT_SECRET, {expiresIn: '1d'});
    const refreshToken = await jwt.sign(payload, process.env.REFRESH_TOKEN_SECRET, {expiresIn: '7d'});
    return {token, refreshToken};
  }
  static async verifyToken(token){
    return await jwt.verify(token, process.env.JWT_SECRET);
  }
  static async decodeToken(token, secret){
    await jwt.verify(token, secret?secret:process.env.JWT_SECRET); // Check if token is valid
    return await jwt.decode(token);
  }
}

export default AuthUltil;