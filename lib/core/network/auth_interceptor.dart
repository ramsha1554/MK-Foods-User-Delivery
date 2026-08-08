import 'package:dio/dio.dart';

import '../../data/api/api_endpoints.dart';
import '../../data/services/auth_storage_service.dart';
import '../utils/app_log.dart';

/// Transparently refreshes the access token on a 401 and retries the
/// original request.
///
/// Extends [QueuedInterceptor] so Dio itself serializes error handling:
/// while a refresh is in flight, any other request that also gets a 401
/// is queued and only proceeds once the in-flight refresh resolves. Combined
/// with [_refreshInFlight], this guarantees at most one call to
/// `/auth/refresh-token` is ever in flight at a time, and every caller that
/// was waiting on it gets retried with the same new access token.
///
/// If the refresh token itself is missing/expired, [onSessionExpired] is
/// invoked so the app can clear the session and drop the user back to the
/// login flow, without this interceptor needing to know anything about
/// navigation or Riverpod state.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required Dio dio,
    required AuthStorageService storage,
    required Future<void> Function() onSessionExpired,
  })  : _dio = dio,
        _storage = storage,
        _onSessionExpired = onSessionExpired,
        _refreshDio = Dio(
          BaseOptions(
            baseUrl: dio.options.baseUrl,
            connectTimeout: dio.options.connectTimeout,
            receiveTimeout: dio.options.receiveTimeout,
            headers: const {'Content-Type': 'application/json'},
          ),
        );

  final Dio _dio;
  final Dio _refreshDio;
  final AuthStorageService _storage;
  final Future<void> Function() _onSessionExpired;

  Future<String?>? _refreshInFlight;

  /// Requests that must never trigger a refresh-and-retry cycle: the refresh
  /// call itself (would recurse) and the pre-auth endpoints (a 401 there
  /// means the OTP was wrong, not that a session expired).
  static const _skipPaths = {
    ApiEndpoints.requestOtp,
    ApiEndpoints.verifyOtp,
    ApiEndpoints.refreshToken,
  };

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;

    if (statusCode != 401 || _skipPaths.contains(path)) {
      handler.next(err);
      return;
    }

    final newAccessToken = await _refreshAccessToken();

    if (newAccessToken == null) {
      await _onSessionExpired();
      handler.next(err);
      return;
    }

    try {
      final retryOptions = err.requestOptions;
      retryOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      final retryResponse = await _dio.fetch(retryOptions);
      handler.resolve(retryResponse);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  /// Ensures only one refresh request is ever in flight. Callers that arrive
  /// while a refresh is already running await the same future instead of
  /// starting a second one.
  Future<String?> _refreshAccessToken() {
    return _refreshInFlight ??= _performRefresh().whenComplete(() {
      _refreshInFlight = null;
    });
  }

  Future<String?> _performRefresh() async {
    final refreshToken = _storage.refreshToken;
    if (refreshToken == null) {
      AppLog.w('[AUTH]', 'refresh', 'No refresh token stored, cannot refresh');
      return null;
    }

    try {
      AppLog.i('[AUTH]', 'refresh', 'Access token expired, refreshing');
      final response = await _refreshDio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      final body = response.data as Map<String, dynamic>;
      final data = (body['data'] as Map<String, dynamic>?) ?? body;
      final newAccessToken = data['accessToken'] as String?;
      final newRefreshToken = data['refreshToken'] as String?;

      if (newAccessToken == null) {
        AppLog.w('[AUTH]', 'refresh', 'Refresh response missing accessToken');
        return null;
      }

      await _storage.updateTokens(
        accessToken: newAccessToken,
        // Backend may or may not rotate the refresh token; keep the old one
        // if a new one wasn't issued.
        refreshToken: newRefreshToken ?? refreshToken,
      );
      _dio.options.headers['Authorization'] = 'Bearer $newAccessToken';

      AppLog.i('[AUTH]', 'refresh', 'Access token refreshed successfully');
      return newAccessToken;
    } on DioException catch (e, st) {
      AppLog.e('[AUTH]', 'refresh', 'Refresh token rejected or expired', null, e, st);
      return null;
    } catch (e, st) {
      AppLog.e('[AUTH]', 'refresh', 'Unexpected refresh failure', null, e, st);
      return null;
    }
  }
}