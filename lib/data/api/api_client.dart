import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/network/app_log_interceptor.dart';
import 'api_endpoints.dart';
import '../models/api_response.dart';

class ApiException implements Exception {
  final int statusCode;
  final String message;
  final String? status;

  const ApiException({
    required this.statusCode,
    required this.message,
    this.status,
  });

  @override
  String toString() => 'ApiException($statusCode): $message';

  bool get isValidationError => statusCode == 400;
  bool get isUnauthorized => statusCode == 401;
  bool get isForbidden => statusCode == 403;
  bool get isNotFound => statusCode == 404;
  bool get isConflict => statusCode == 409;
  bool get isRateLimited => statusCode == 429;
  bool get isServerError => statusCode >= 500;
}

class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio})
      : _dio = dio ??
            _createDio();

  String? get token => _dio.options.headers['Authorization']?.toString().replaceFirst('Bearer ', '');

  void setToken(String? token) {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      _dio.options.headers.remove('Authorization');
    }
  }

  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParams,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<ApiResponse> patch(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: body,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<ApiResponse> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<ApiResponse> uploadFile(
    String path, {
    required String fieldName,
    required File file,
    Map<String, String>? fields,
  }) async {
    try {
      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
        if (fields != null) ...fields,
      });

      final response = await _dio.post(
        path,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  ApiResponse _handleResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    final apiResponse = ApiResponse.fromJson(data);

    if (!apiResponse.success) {
      throw ApiException(
        statusCode: response.statusCode ?? 0,
        message: apiResponse.message ?? 'Unknown error',
        status: apiResponse.status,
      );
    }

    return apiResponse;
  }

  ApiException _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const ApiException(
        statusCode: 0,
        message: 'Request timed out',
      );
    }

    if (e.type == DioExceptionType.connectionError) {
      throw const NetworkException('No internet connection');
    }

    if (e.response != null) {
      final body = e.response!.data as Map<String, dynamic>?;
      return ApiException(
        statusCode: e.response!.statusCode ?? 0,
        message: body?['message'] as String? ?? 'Unknown error',
        status: body?['status'] as String?,
      );
    }

    return const ApiException(
      statusCode: 0,
      message: 'Unexpected error occurred',
    );
  }

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    dio.interceptors.add(AppLogInterceptor());
    return dio;
  }

  void dispose() {
    _dio.close();
  }
}


