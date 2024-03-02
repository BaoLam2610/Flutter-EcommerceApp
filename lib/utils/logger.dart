import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
        "--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
    Log.info('Headers:');
    options.headers.forEach((k, v) => Log.info('$k: $v'));
    Log.info('queryParameters:');
    options.queryParameters.forEach((k, v) => Log.info('$k: $v'));
    if (options.data != null) {
      Log.info('Body: ${options.data}');
    }
    Log.info('--> END ${options.method.toUpperCase()}');

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    // Log the error request and error message
    Log.error(
      '<-- onError: ${options.method} request => $requestPath',
    );
    Log.error(
      'onError: ${err.error}, Message: ${err.message}',
    );
    Log.error(
      'onError: ${err.response}',
    );
    Log.error('<-- End error');
    // Call the super class to continue handling the error
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.info('<-- ${response.statusCode} ${response.realUri}');
    Log.info('Headers:');
    response.headers.forEach((k, v) => Log.info('$k: $v'));
    Log.info('Response: ${response.data}');
    Log.info('<-- END HTTP');
    // Call the super class to continue handling the response
    return super.onResponse(response, handler);
  }
}
