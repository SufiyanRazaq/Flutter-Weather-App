class AppExceptions implements Exception {
  final String? prefix;
  final String? message;
  AppExceptions({this.prefix, this.message});

  @override
  String toString() {
    // TODO: implement toString
    return '$prefix$message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message])
      : super(message: 'Internet Error Issues');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message])
      : super(message: 'The request has timed out');
}

class ServerError extends AppExceptions {
  ServerError([String? message])
      : super(message: 'An internal server error occured');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message])
      : super(message: 'The Url provided is Invalid');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message: 'Failed to fetch data from server');
}
