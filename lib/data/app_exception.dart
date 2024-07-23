class AppException implements Exception{
  late final _message;
  late final _prefix;

  AppException([this._message,this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message,':');
}

class ServerDataException extends AppException{
  ServerDataException([String? message]) : super(message,'');
}

class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message,'Invalid request %');
}

class UnauthorisedException extends AppException{
  UnauthorisedException ([String? message]) : super(message,'Unauthorised request %');
}

class InvalidInputException extends AppException{
  InvalidInputException ([String? message]) : super(message,'Invalid Input %');
}