sealed class DomainException implements Exception {
  DomainException({
    required this.message,
    this.stackTrace,
  });
  String message;
  StackTrace? stackTrace;

  @override
  String toString() {
    String message = this.message;

    return 'Exception: $message, StackTrace: $stackTrace';
  }
}

class UnknownException extends DomainException {
  UnknownException({String? message, super.stackTrace, int? statusCode})
      : super(
          message: message ?? 'unknown Exception',
        );
}

class AuthenticationException extends DomainException {
  AuthenticationException({required super.message});

  static AuthenticationException invalidCredentials() {
    return AuthenticationException(message: 'Invalid credentials');
  }

  static AuthenticationException userNotFound() {
    return AuthenticationException(message: 'User not found');
  }

  static AuthenticationException unauthorized() {
    return AuthenticationException(message: 'User is not authorized');
  }
}

class BadRequest extends DomainException {
  BadRequest({super.stackTrace}) : super(message: 'bad Request');
}

class UnknownError extends DomainException {
  UnknownError() : super(message: 'unknown Error');
}

class NoInternetConnectionException extends DomainException {
  NoInternetConnectionException() : super(message: 'no Internet Connection Exception');
}

class MapperException extends DomainException {
  MapperException() : super(message: 'mapper Exception');
}

class NetworkException extends DomainException {
  NetworkException({required super.message, super.stackTrace});
}
