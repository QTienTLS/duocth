const statusCode = {
  NO_CONTENT: 'dth-204',
  BAD_REQUEST: 'dth-400',
  UNAUTHORIZED: 'dth-401',
  FORBIDDEN: 'dth-403',
  NOT_FOUND: 'dth-404',
  CONFLICT: 'dth-409',
  INTERNAL_SERVER_ERROR: 'dth-500',
  TOO_MANY_REQUESTS: 'dth-429',
}

const reason = {
  NO_CONTENT: 'No Content',
  BAD_REQUEST: 'Bad Request',
  UNAUTHORIZED: 'Unauthorized',
  FORBIDDEN: 'Forbidden',
  NOT_FOUND: 'Not Found',
  CONFLICT: 'Conflict',
  INTERNAL_SERVER_ERROR: 'Internal Server Error',
  TOO_MANY_REQUESTS: 'Too Many Requests'
}



class ErrorResponse extends Error {
  constructor(message, statusCode) {
    super(message);
    this.statusCode = statusCode;
  }
}

class TooManyRequestsError extends ErrorResponse {
  constructor(message) {
    super(message || reason.TOO_MANY_REQUESTS, statusCode.TOO_MANY_REQUESTS);
  }
}

class ConflictError extends ErrorResponse {
  constructor(message) {
    super(message || reason.CONFLICT , statusCode.CONFLICT);
  }
}

class NotFoundError extends ErrorResponse {
  constructor(message) {
    super(message || reason.NOT_FOUND, statusCode.NOT_FOUND);
  }
}

class ForbiddenError extends ErrorResponse {
  constructor(message) {
    super(message || reason.FORBIDDEN, statusCode.FORBIDDEN);
  }
}

class BadRequestError extends ErrorResponse {
  constructor(message) {
    super(message || reason.BAD_REQUEST, statusCode.BAD_REQUEST);
  }
}

class NoContentError extends ErrorResponse {
  constructor(message) {
    super(message || reason.NO_CONTENT, statusCode.NO_CONTENT);
  }
}

class UnauthorizedError extends ErrorResponse {
  constructor(message) {
    super(message || reason.UNAUTHORIZED, statusCode.UNAUTHORIZED);
  }
}

class InternalServerError extends ErrorResponse {
  constructor(message) {
    super(message || reason.INTERNAL_SERVER_ERROR, statusCode.INTERNAL_SERVER_ERROR);
  }
}


export {
  ConflictError,
  NotFoundError,
  ForbiddenError,
  BadRequestError,
  UnauthorizedError,
  InternalServerError,
  TooManyRequestsError,
  NoContentError
}