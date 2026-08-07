import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

import '../constants/app_config.dart';

abstract final class AppLog {
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
  ]) =>
      _log('ERROR', tag, context, message, payload, error: error, stack: stack);

  static void f(
    String tag,
    String context,
    String message, [
    Map<String, dynamic>? payload,
    Object? error,
    StackTrace? stack,
  ]) =>
      _log('FATAL', tag, context, message, payload, error: error, stack: stack);

  static const _json = JsonEncoder.withIndent('  ');

  static String prettyJson(dynamic data) {
    try {
      return _json.convert(data);
    } catch (_) {
      return data.toString();
    }
  }

  static void _log(
    String level,
    String tag,
    String context,
    String message,
    Map<String, dynamic>? payload, {
    Object? error,
    StackTrace? stack,
  }) {
    if (!kDebugMode) return;

    final payloadStr = payload != null && payload.isNotEmpty
        ? '  ${payload.entries.map((e) => '${e.key}: ${e.value}').join(', ')}'
        : '';

    final line = '[$level] $tag [$context] → $message$payloadStr';

    dev.log(
      line,
      name: AppConfig.logName,
      error: error,
      stackTrace: stack,
    );
  }
}
