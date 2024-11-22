import { UnauthorizedError } from "@/core/error.response";
import AuthUltil from "@/ultils/auth";
import AuthService from "@/services/authService";

const verifyToken = async(req, res, next) => {
  if(!req.header('authorization')) {
    throw new UnauthorizedError('Không có thông tin đăng nhập !');
  }
  // Get token from header
  const token = req.header('authorization').split('Bearer ')[1];
  // Check if no token
  if (!token) {
    throw new UnauthorizedError('Không có thông tin đăng nhập !');
  }
  // Verify token
  try {
    const decoded = await AuthUltil.decodeToken(token);
    const id = decoded.id;
    if(!id) throw new UnauthorizedError('Token không hợp lệ !');
    const user = await AuthService.getUserInfo(id);
    if(!user) throw new UnauthorizedError('Không tìm thấy thông tin user !');
    req.user = user;
    return next();
  } catch (error) {
    throw new UnauthorizedError(error.message);
  }
  return next();
}

export default verifyToken;