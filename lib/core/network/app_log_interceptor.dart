import 'package:dio/dio.dart';

import '../utils/app_log.dart';

class AppLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final uri = '${options.baseUrl}${options.path}';
    final payload = <String, dynamic>{
      'method': options.method,
      'url': uri,
    };

    if (options.queryParameters.isNotEmpty) {
      payload['params'] = options.queryParameters.toString();
    }

    if (options.data != null) {
      if (options.data is FormData) {
        payload['body'] = '<FormData>';
      } else {
        payload['body'] = AppLog.prettyJson(options.data);
      }
    }

    AppLog.i('[API]', options.path, '➡️ Request', payload);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final payload = <String, dynamic>{
      'status': response.statusCode,
      'url': response.requestOptions.uri.toString(),
    };

    if (response.data != null) {
      payload['body'] = AppLog.prettyJson(response.data);
    }

    AppLog.i('[API]', response.requestOptions.path, '⬅️ Response', payload);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final payload = <String, dynamic>{
      'method': err.requestOptions.method,
      'url': err.requestOptions.uri.toString(),
      'type': err.type.name,
    };

    if (err.response != null) {
      payload['status'] = err.response!.statusCode;
      if (err.response!.data != null) {
        payload['body'] = AppLog.prettyJson(err.response!.data);
      }
    }

    if (err.message != null) {
      payload['error'] = err.message;
    }

    AppLog.e('[API]', err.requestOptions.path, '❌ Error', payload, err, err.stackTrace);
    super.onError(err, handler);
  }
}
