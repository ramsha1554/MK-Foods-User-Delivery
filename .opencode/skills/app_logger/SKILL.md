---
name: app_logger
description: Skill for implementing a consistent, human-readable, structured logging system across the MK Foods Flutter app — covering API request/response logs, state events, navigation, and general debug output.
---

# 🪵 MK Foods - App Logger Skill

This skill defines the **single logging standard** for the entire app. Every log line — whether it comes from an API call, a Riverpod provider, a navigation event, or a UI error — must follow the patterns below so that the debug console is **instantly scannable, searchable, and self-explanatory** without opening a debugger.

---

## 📐 1. Log Line Anatomy

Every log line follows this fixed structure:

```
[LEVEL] [TAG] [CONTEXT] → MESSAGE  {payload?}
```

| Part | Description | Example |
|------|-------------|---------|
| `[LEVEL]` | Severity indicator (see §2) | `[INFO]`, `[ERROR]` |
| `[TAG]` | The system or feature area | `[API]`, `[AUTH]`, `[CART]` |
| `[CONTEXT]` | The method/widget/provider name | `[loginUser]`, `[CartNotifier]` |
| `→` | Fixed separator arrow | `→` |
| `MESSAGE` | Short, imperative English sentence | `Request sent`, `Token expired` |
| `{payload?}` | Optional structured key=value pairs | `{status: 401, url: /auth/login}` |

### ✅ Good examples
```
[INFO]  [API]  [loginUser]       → Request sent        {method: POST, url: /auth/login}
[INFO]  [API]  [loginUser]       → Response received   {status: 200, duration: 312ms}
[ERROR] [API]  [loginUser]       → Request failed      {status: 401, message: Invalid credentials}
[DEBUG] [AUTH] [AuthNotifier]    → State changed       {from: loading, to: unauthenticated}
[WARN]  [CART] [CartNotifier]    → Item count mismatch {local: 3, remote: 2}
[INFO]  [NAV]  [AppRouter]       → Navigating          {from: /login, to: /home}
```

### ❌ Bad examples — avoid these
```
print('error');                   // No context, no level, no structure
debugPrint('API call done');      // Vague message, no payload
log('Something went wrong!!!');   // Exclamation, no tag, no context
print(response.body);             // Raw dump — unreadable in prod
```

---

## 🚦 2. Log Levels

Use exactly five levels. Never invent custom levels.

| Level | Symbol | Dart method | When to use |
|-------|--------|-------------|-------------|
| `[DEBUG]` | 🔵 | `AppLog.d(...)` | Low-level detail useful only while actively developing a feature. Remove before PR or mark with a TODO. |
| `[INFO]`  | 🟢 | `AppLog.i(...)` | Normal flow confirmations — request sent, response received, screen loaded. |
| `[WARN]`  | 🟡 | `AppLog.w(...)` | Unexpected but recoverable state — fallback used, cache miss, retry attempt. |
| `[ERROR]` | 🔴 | `AppLog.e(...)` | Operation failed. Always include the exception and stack trace when available. |
| `[FATAL]` | ⛔ | `AppLog.f(...)` | Unrecoverable crash or data corruption. Log then rethrow or exit gracefully. |

---

## 🏷️ 3. Standard Tags

Use only these tags. Never use free-form strings as tags.

| Tag | Covers |
|-----|--------|
| `[API]` | All HTTP requests and responses via Dio / http |
| `[AUTH]` | Login, logout, token refresh, session expiry |
| `[CART]` | Cart add, remove, update, sync |
| `[ORDER]` | Order placement, status polling, cancellation |
| `[NAV]` | Route pushes, pops, and redirects |
| `[STATE]` | Riverpod provider state transitions |
| `[STORAGE]` | SharedPreferences, Hive, local file reads/writes |
| `[NOTIF]` | Push notification receive and tap events |
| `[UI]` | Widget lifecycle errors, rendering failures |
| `[GEO]` | Location permission, GPS updates, map events |
| `[APP]` | App lifecycle — foreground, background, cold start |

---

## 🛠️ 4. The `AppLog` Utility Class

Place this file at `lib/core/utils/app_log.dart`. This is the **only** logging entry point in the project — never call `print`, `debugPrint`, or `developer.log` directly in feature code.

```dart
// lib/core/utils/app_log.dart

import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

/// Single logging facade for the MK Foods app.
///
/// Format: [LEVEL] [TAG] [CONTEXT] → MESSAGE  {key: value, ...}
///
/// Usage:
///   AppLog.i('[API]', 'loginUser', 'Request sent', {'method': 'POST', 'url': '/auth/login'});
///   AppLog.e('[AUTH]', 'TokenRefresh', 'Refresh failed', {'status': 403}, error: e, stack: st);
abstract final class AppLog {
  // ── Public API ────────────────────────────────────────────────────────────

  static void d(String tag, String context, String message, [Map<String, dynamic>? payload]) =>
      _log('DEBUG', tag, context, message, payload);

  static void i(String tag, String context, String message, [Map<String, dynamic>? payload]) =>
      _log('INFO ', tag, context, message, payload);

  static void w(String tag, String context, String message, [Map<String, dynamic>? payload]) =>
      _log('WARN ', tag, context, message, payload);

  static void e(
    String tag,
    String context,
    String message, [
    Map<String, dynamic>? payload,
    Object? error,
    StackTrace? stack,
  ]) {
    _log('ERROR', tag, context, message, payload, error: error, stack: stack);
  }

  static void f(
    String tag,
    String context,
    String message, [
    Map<String, dynamic>? payload,
    Object? error,
    StackTrace? stack,
  ]) {
    _log('FATAL', tag, context, message, payload, error: error, stack: stack);
  }

  // ── Internal ──────────────────────────────────────────────────────────────

  static void _log(
    String level,
    String tag,
    String context,
    String message,
    Map<String, dynamic>? payload, {
    Object? error,
    StackTrace? stack,
  }) {
    if (!kDebugMode) return; // Silent in release builds

    final payloadStr = payload != null && payload.isNotEmpty
        ? '  {${payload.entries.map((e) => '${e.key}: ${e.value}').join(', ')}}'
        : '';

    final line = '[$level] $tag [$context] → $message$payloadStr';

    dev.log(
      line,
      name: 'MKFoods',
      error: error,
      stackTrace: stack,
    );
  }
}
```

---

## 🌐 5. API Logging Pattern

All HTTP calls must log four moments: **before request**, **on success**, **on error**, and optionally **on retry**.

### 5a. Dio Interceptor (Recommended)

Place this at `lib/core/network/app_log_interceptor.dart` and add it to your `Dio` instance. This automatically logs **every** API call without touching individual repository methods.

```dart
// lib/core/network/app_log_interceptor.dart

import 'package:dio/dio.dart';
import '../utils/app_log.dart';

class AppLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLog.i('[API]', options.path, 'Request sent', {
      'method': options.method,
      'url': '${options.baseUrl}${options.path}',
      if (options.queryParameters.isNotEmpty)
        'params': options.queryParameters.toString(),
    });
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLog.i('[API]', response.requestOptions.path, 'Response received', {
      'status': response.statusCode,
      'url': response.requestOptions.uri.toString(),
    });
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLog.e('[API]', err.requestOptions.path, 'Request failed', {
      'status': err.response?.statusCode ?? 'no-response',
      'url': err.requestOptions.uri.toString(),
      'type': err.type.name,
      'message': err.message ?? 'unknown',
    }, err, err.stackTrace);
    super.onError(err, handler);
  }
}
```

**Wire it up in your Dio factory:**
```dart
final dio = Dio(baseOptions);
dio.interceptors.add(AppLogInterceptor());
```

### 5b. Manual Repository Logging (when no interceptor is used)

If a specific repository call needs extra context beyond what the interceptor captures:

```dart
Future<UserModel> loginUser(String email, String password) async {
  AppLog.i('[AUTH]', 'loginUser', 'Attempting login', {'email': email});
  try {
    final response = await _dio.post('/auth/login', data: { ... });
    AppLog.i('[AUTH]', 'loginUser', 'Login successful', {'userId': response.data['id']});
    return UserModel.fromJson(response.data);
  } on DioException catch (e, st) {
    AppLog.e('[AUTH]', 'loginUser', 'Login failed', {
      'status': e.response?.statusCode,
      'reason': e.response?.data?['message'] ?? e.message,
    }, e, st);
    rethrow;
  }
}
```

---

## ⚙️ 6. Riverpod State Logging Pattern

Log provider state changes at the transition point, not inside build methods.

```dart
// Inside a StateNotifier or AsyncNotifier:

Future<void> fetchMenu() async {
  AppLog.i('[STATE]', 'MenuNotifier', 'State changed', {'from': 'idle', 'to': 'loading'});
  state = const AsyncValue.loading();
  try {
    final items = await _repo.getMenuItems();
    AppLog.i('[STATE]', 'MenuNotifier', 'State changed', {
      'from': 'loading',
      'to': 'data',
      'itemCount': items.length,
    });
    state = AsyncValue.data(items);
  } catch (e, st) {
    AppLog.e('[STATE]', 'MenuNotifier', 'State changed', {
      'from': 'loading',
      'to': 'error',
    }, e, st);
    state = AsyncValue.error(e, st);
  }
}
```

---

## 🔍 7. Verification Checklist

- [ ] `lib/core/utils/app_log.dart` exists and is the **only** logging entry point.
- [ ] `AppLogInterceptor` is registered on the `Dio` instance.
- [ ] Zero raw `print(...)` or `debugPrint(...)` calls remain in feature code.
- [ ] Every `AppLog.e` call in a catch block passes the original exception object and stack trace.
- [ ] All log lines in the console follow the `[LEVEL] [TAG] [CONTEXT] → MESSAGE` format.
- [ ] `AppLog` calls inside `if (!kDebugMode)` guard — no logs leak into release builds.
