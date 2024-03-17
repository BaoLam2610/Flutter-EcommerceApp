import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../core/core.dart';

// Define an enum for the different log levels
enum Level { debug, info, warning, error, alien }

// Define a logDebug function that logs messages at the specified level
// log different colors
class Log {
  // Define ANSI escape codes for different colors
  static const String resetColor = '\x1B[0m';
  static const String redColor = '\x1B[31m'; // Red
  static const String greenColor = '\x1B[32m'; // Green
  static const String yellowColor = '\x1B[33m'; // Yellow
  static const String cyanColor = '\x1B[36m'; // Cyan

  static void log(String message, {Level level = Level.info}) {
    // Get the current time in hours, minutes, and seconds
    final now = DateTime.now();
    final timeString =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

    // Only log messages if the app is running in debug mode
    if (kDebugMode) {
      try {
        String logMessage;
        switch (level) {
          case Level.debug:
            logMessage = '$cyanColor[DEBUG][$timeString] $message$resetColor';
            break;
          case Level.info:
            logMessage = '$greenColor[INFO][$timeString] $message$resetColor';
            break;
          case Level.warning:
            logMessage =
                '$yellowColor[WARNING][$timeString] $message $resetColor';
            break;
          case Level.error:
            logMessage = '$redColor[ERROR][$timeString] $message $resetColor';
            break;
          case Level.alien:
            logMessage = '$redColor[ALIEN][$timeString] $message $resetColor';
            break;
        }
        //print(logMessage);
        // Use the DebugPrintCallback to ensure long strings are not truncated
        debugPrint(logMessage);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static void debug(String message) {
    log(message, level: Level.debug);
  }

  static void info(String message) {
    log(message, level: Level.info);
  }

  static void error(String message) {
    log(message, level: Level.error);
  }
}

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Log.info(
      "--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}",
    );

    if (options.headers.isNotEmpty) {
      Log.info('Header: ');
      prettyPrintJson(options.headers);
    }

    if (options.queryParameters.isNotEmpty) {
      Log.info('Query parameters: ');
      prettyPrintJson(options.queryParameters);
    }

    if (options.data != null) {
      Log.info('Payload json: ');
      prettyPrintJson(options.data);
    }
    Log.info('--> END ${options.method.toUpperCase()}');

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    Log.error('<-- ERROR: ');
    Log.error('<-- ${options.method} $requestPath');

    if (err.response != null) {
      Log.error('Status code: ${err.response?.statusCode}');
      Log.error('Response: ');
      prettyPrintJson(err.response!.data, level: Level.error);
      Log.error('<-- END ${options.method}');
      return super.onError(err, handler);
    }

    if (err.error != null) {
      Log.error('Exception: ${err.error}');
    }

    if (!err.message.isNullOrEmpty) {
      Log.error('Message: ${err.message}');
    }

    Log.error('<-- END ${options.method}');
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.info('<-- ${response.requestOptions.method} ${response.realUri}');
    Log.info('Status code: ${response.statusCode}');

    if (response.requestOptions.headers.isNotEmpty) {
      Log.info('Header: ');
      prettyPrintJson(response.requestOptions.headers);
    }

    if (response.data != null) {
      Log.info('Response: ');
      prettyPrintJson(response.data);
    }

    Log.info('<-- END ${response.requestOptions.method}');
    return super.onResponse(response, handler);
  }

  void prettyPrintString(String input, {Level level = Level.info}) {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(input);
    final dynamic prettyString = encoder.convert(object);
    prettyString.split('\n').forEach(
          (element) => Log.log(
            element,
            level: level,
          ),
        );
  }

  void prettyPrintJson(Map<String, dynamic> map, {Level level = Level.info}) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    dynamic prettyString = encoder.convert(map);
    prettyString.split('\n').forEach(
          (element) => Log.log(
            element,
            level: level,
          ),
        );
  }
}
