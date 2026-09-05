import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_getx/core/global/global.dart';

import '../constants/api_constants.dart';
import '../constants/log_colors.dart';
import 'dio_exception_handler.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _initializeInterceptors();
  }

  Dio get dio => _dio;

  void _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          /// Get token from storage
          final token = await _getToken();

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          if (kDebugMode) {
            // debugPrint('''
            // ══════════ REQUEST ══════════
            // URL: ${options.uri}
            // METHOD: ${options.method}
            // HEADERS: ${options.headers}
            // BODY: ${options.data}
            // ═════════════════════════════
            // ''');

            debugPrint('''
            ${LogColors.cyan}${LogColors.bold}
            ╔══════════════════════════════════════════════╗
            ║              🌐 API REQUEST                  ║
            ╚══════════════════════════════════════════════╝
            ${LogColors.reset}
            ${LogColors.yellow}🔗 URL     :${LogColors.reset} ${options.uri}
            ${LogColors.green}📤 METHOD  :${LogColors.reset} ${options.method}
            ${LogColors.blue}📋 HEADERS :${LogColors.reset} ${options.headers}
            ${LogColors.magenta}📦 BODY    :${LogColors.reset} ${options.data}
            
            ${LogColors.cyan}══════════════════════════════════════════════${LogColors.reset}
            ''');
          }

          handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            // debugPrint('''
            // ══════════ RESPONSE ══════════
            // URL: ${response.requestOptions.uri}
            // STATUS: ${response.statusCode}
            // DATA: ${response.data}
            // ══════════════════════════════
            // ''');
            debugPrint('''
            ${LogColors.green}${LogColors.bold}
            ╔══════════════════════════════════════════════╗
            ║              ✅ API RESPONSE                 ║
            ╚══════════════════════════════════════════════╝
            ${LogColors.reset}
            ${LogColors.yellow}🔗 URL         :${LogColors.reset} ${response.requestOptions.uri}
            ${LogColors.cyan}📥 STATUS CODE :${LogColors.reset} ${response.statusCode}
            ${LogColors.magenta}📦 DATA        :${LogColors.reset} ${response.data}
            
            ${LogColors.green}══════════════════════════════════════════════${LogColors.reset}
            ''');
          }

          handler.next(response);
        },
        onError: (error, handler) {
          if (kDebugMode) {
            // debugPrint('''
            // ══════════ ERROR ══════════
            // URL: ${error.requestOptions.uri}
            // ERROR: ${error.message}
            // STATUS: ${error.response?.statusCode}
            // ═══════════════════════════
            // ''');
            debugPrint('''
            ${LogColors.red}${LogColors.bold}
            ╔══════════════════════════════════════════════╗
            ║                ❌ API ERROR                  ║
            ╚══════════════════════════════════════════════╝
            ${LogColors.reset}
            ${LogColors.yellow}🔗 URL         :${LogColors.reset} ${error.requestOptions.uri}
            ${LogColors.cyan}📤 METHOD      :${LogColors.reset} ${error.requestOptions.method}
            ${LogColors.red}⚠️  TYPE        :${LogColors.reset} ${error.type}
            ${LogColors.red}💥 MESSAGE     :${LogColors.reset} ${error.message}
            ${LogColors.yellow}📊 STATUS CODE :${LogColors.reset} ${error.response?.statusCode}
            ${LogColors.magenta}📦 DATA        :${LogColors.reset} ${error.response?.data}
            
            ${LogColors.red}══════════════════════════════════════════════${LogColors.reset}
            ''');
          }

          handler.reject(error);
        },
      ),
    );
  }

  Future<String?> _getToken() async {
    Global.init();
    return Global.token;
  }

  Future<void> updateToken(String token) async {
    _dio.options.headers["Authorization"] = "Bearer $token";
  }

  void clearToken() {
    _dio.options.headers.remove("Authorization");
  }

  // ---------------------------------------------------
  // GET
  // ---------------------------------------------------

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // ---------------------------------------------------
  // POST
  // ---------------------------------------------------

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // ---------------------------------------------------
  // PUT
  // ---------------------------------------------------

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // ---------------------------------------------------
  // PATCH
  // ---------------------------------------------------

  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // ---------------------------------------------------
  // DELETE
  // ---------------------------------------------------

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // ---------------------------------------------------
  // File Upload - POST
  // ---------------------------------------------------

  Future<Response> uploadFile({
    required String path,
    required File file,
    String fieldName = "file",
    Map<String, dynamic>? body,
  }) async {
    try {
      FormData formData = FormData();

      if (body != null) {
        formData.fields.addAll(
          body.entries.map((e) => MapEntry(e.key, e.value.toString())),
        );
      }

      formData.files.add(
        MapEntry(
          fieldName,
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        ),
      );

      return await _dio.post(path, data: formData);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // ---------------------------------------------------
  // File Upload - PUT
  // ---------------------------------------------------

  Future<Response> uploadFilePut({
    required String path,
    required File file,
    String fieldName = "file",
    Map<String, dynamic>? body,
  }) async {
    try {
      FormData formData = FormData();

      if (body != null) {
        formData.fields.addAll(
          body.entries.map((e) => MapEntry(e.key, e.value.toString())),
        );
      }

      formData.files.add(
        MapEntry(
          fieldName,
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        ),
      );

      return await _dio.put(path, data: formData);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // ---------------------------------------------------
  // Files Upload - POST
  // ---------------------------------------------------

  Future<Response> uploadFiles({
    required String path,
    required List<File> files,
    String fieldName = 'files',
    Map<String, dynamic>? body,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final formData = FormData();

      // Add body fields
      if (body != null) {
        formData.fields.addAll(
          body.entries.map((e) => MapEntry(e.key, e.value.toString())),
        );
      }

      // Add files
      for (final file in files) {
        formData.files.add(
          MapEntry(
            fieldName,
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      return await _dio.post(
        path,
        data: formData,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // ---------------------------------------------------
  // Files Upload - PUT
  // ---------------------------------------------------

  Future<Response> uploadFilesPut({
    required String path,
    required List<File> files,
    String fieldName = 'files',
    Map<String, dynamic>? body,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final formData = FormData();

      if (body != null) {
        formData.fields.addAll(
          body.entries.map((e) => MapEntry(e.key, e.value.toString())),
        );
      }

      for (final file in files) {
        formData.files.add(
          MapEntry(
            fieldName,
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      return await _dio.put(
        path,
        data: formData,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // ---------------------------------------------------
  // Files Upload (Multipart) - POST & PUT
  // ---------------------------------------------------

  Future<Response> uploadMultipart({
    required String path,
    required String method,
    List<File>? files,
    String fieldName = 'files',
    Map<String, dynamic>? body,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final formData = FormData();

      // Form fields
      if (body != null) {
        formData.fields.addAll(
          body.entries.map((e) => MapEntry(e.key, e.value.toString())),
        );
      }

      // Files
      if (files != null) {
        for (final file in files) {
          formData.files.add(
            MapEntry(
              fieldName,
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }

      return await _dio.request(
        path,
        data: formData,
        options: Options(method: method),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }
}
