abstract class AppException implements Exception {
  final String message;
  final String? prefix;

  const AppException(this.message, [this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  const FetchDataException([
    String message = "Unable to communicate with server.",
  ]) : super(message, "Fetch Data Error: ");
}

class BadRequestException extends AppException {
  const BadRequestException([String message = "Invalid request."])
    : super(message, "Bad Request: ");
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([String message = "Unauthorized access."])
    : super(message, "Unauthorized: ");
}

class ForbiddenException extends AppException {
  const ForbiddenException([String message = "Access forbidden."])
    : super(message, "Forbidden: ");
}

class NotFoundException extends AppException {
  const NotFoundException([String message = "Resource not found."])
    : super(message, "Not Found: ");
}

class ConflictException extends AppException {
  const ConflictException([String message = "Conflict occurred."])
    : super(message, "Conflict: ");
}

class ValidationException extends AppException {
  const ValidationException([String message = "Validation failed."])
    : super(message, "Validation Error: ");
}

class InternalServerException extends AppException {
  const InternalServerException([String message = "Internal server error."])
    : super(message, "Server Error: ");
}

class ServiceUnavailableException extends AppException {
  const ServiceUnavailableException([String message = "Service unavailable."])
    : super(message, "Service Unavailable: ");
}

class NoInternetException extends AppException {
  const NoInternetException([String message = "No internet connection."])
    : super(message, "Network Error: ");
}

class ConnectionTimeoutException extends AppException {
  const ConnectionTimeoutException([String message = "Connection timeout."])
    : super(message, "Timeout Error: ");
}

class ReceiveTimeoutException extends AppException {
  const ReceiveTimeoutException([String message = "Response timeout."])
    : super(message, "Timeout Error: ");
}

class SendTimeoutException extends AppException {
  const SendTimeoutException([String message = "Request timeout."])
    : super(message, "Timeout Error: ");
}

class RequestCancelledException extends AppException {
  const RequestCancelledException([String message = "Request cancelled."])
    : super(message, "Cancelled: ");
}

class UnknownNetworkException extends AppException {
  const UnknownNetworkException([String message = "Unknown network error."])
    : super(message, "Unknown Error: ");
}
