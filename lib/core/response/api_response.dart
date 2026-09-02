import 'package:mvvm_getx/core/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(T this.data) : status = Status.completed;

  ApiResponse.error(String this.message) : status = Status.error;

  @override
  String toString() {
    return 'ApiResponse{status: $status, data: $data, message: $message}';
  }
}
