import 'dart:io';

import 'package:dio/dio.dart';

import 'app_exceptions.dart';

class DioExceptionHandler {
  static AppException handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ConnectionTimeoutException();

      case DioExceptionType.sendTimeout:
        return const SendTimeoutException();

      case DioExceptionType.receiveTimeout:
        return const ReceiveTimeoutException();

      case DioExceptionType.cancel:
        return const RequestCancelledException();

      case DioExceptionType.connectionError:
        return const NoInternetException();

      case DioExceptionType.badCertificate:
        return const FetchDataException("SSL certificate validation failed.");

      case DioExceptionType.badResponse:
        return _handleStatusCode(
          error.response?.statusCode,
          error.response?.data,
        );

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const NoInternetException();
        }

        return const UnknownNetworkException();

      default:
        return const UnknownNetworkException();
    }
  }

  static AppException _handleStatusCode(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return BadRequestException(data?["message"] ?? "Bad request");

      case 401:
        return UnauthorizedException(data?["message"] ?? "Unauthorized");

      case 403:
        return ForbiddenException(data?["message"] ?? "Forbidden");

      case 404:
        return NotFoundException(data?["message"] ?? "Not found");

      case 409:
        return ConflictException(data?["message"] ?? "Conflict");

      case 422:
        return ValidationException(data?["message"] ?? "Validation failed");

      case 500:
        return InternalServerException(
          data?["message"] ?? "Internal server error",
        );

      case 503:
        return ServiceUnavailableException(
          data?["message"] ?? "Service unavailable",
        );

      default:
        return FetchDataException("Server returned status code $statusCode");
    }
  }
}
