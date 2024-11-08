
const code = {
  OK: 'dth-200',
  CREATED: 'dth-201',
}

const message = {
  OK: 'Success',
  CREATED: 'Created',
}

class SuccessResponse {
  constructor({message, statusCode, data}) {
    this.data = data;
    this.message = message;
    this.statusCode = statusCode;
  }
  send(res, headers = {}){
    return res.status(200).json({
      code: this.statusCode,
      message: this.message,
      data: this.data,
    });
  }
}

class OK extends SuccessResponse {
  constructor(message = message.OK, data) {
    super({message: message, statusCode: code.OK, data});
  }
}

class CREATED extends SuccessResponse {
  constructor(message = message.CREATED, data) {
    super({message: message, statusCode: code.CREATED, data});
  }
}

export {
  OK,
  CREATED,
}
