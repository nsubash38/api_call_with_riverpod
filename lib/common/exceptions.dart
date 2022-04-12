class CustomException implements Exception {
  CustomException([this._message, this._prefix, this.statusCode]);

  final dynamic _message;
  final dynamic _prefix;
  final int? statusCode;

  dynamic get message => _message;
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message, int? statusCode])
      : super(message, "Error During Communication: ", statusCode);
}

class NoInternetException extends CustomException {
  NoInternetException([String? message, int? statusCode])
      : super(message, "No Internet Connection", statusCode);
}

class ResourceNotFoundException extends CustomException {
  ResourceNotFoundException([String? message, int? statusCode])
      : super(message, "Resource not found.Error code  404 ", statusCode);
}

class InternalServerErrorException extends CustomException {
  InternalServerErrorException([String? message, int? statusCode])
      : super(message, "Server error ", statusCode);
}
