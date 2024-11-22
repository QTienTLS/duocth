import { ForbiddenError } from "@/core/error.response"

const checkAdmin = (req, res, next) => {
  if(!req.user || req.user.role !== 'admin') {
    throw new ForbiddenError('Bạn không có quyền truy cập');
  }
  return next();
}

export default checkAdmin;