import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../gen/locale_keys.g.dart';
import 'data_response.dart';

class ConnectionTimeOutException implements Exception {
  const ConnectionTimeOutException();

  @override
  String toString() {
    return LocaleKeys.error_connect_timeout.tr();
  }
}

class BadRequestException implements Exception {
  final DioException exception;

  const BadRequestException(this.exception);

  @override
  String toString() {
    String messageError = LocaleKeys.error_system.tr();
    try {
      if (exception.response?.data != null) {
        final json = exception.response?.data as Map<String, dynamic>;
        final response = BaseResponse.fromJson(json);

        if (response.error is String) {
          messageError = response.error;
        }
        if (response.error is List<dynamic>) {
          messageError =
              response.error.map((e) => e.toString()).toList().join(", ");
        }
        return messageError;
      }
      return messageError;
    } catch (e) {
      return messageError;
    }
  }
}

class InternalServerErrorException implements Exception {
  const InternalServerErrorException();

  @override
  String toString() {
    return LocaleKeys.error_server.tr();
  }
}

class UnauthorizedException implements Exception {
  const UnauthorizedException();

  @override
  String toString() {
    return LocaleKeys.error_access_denied.tr();
  }
}

class NotFoundException implements Exception {
  const NotFoundException();

  @override
  String toString() {
    return LocaleKeys.error_request_not_found.tr();
  }
}

class NoInternetConnectionException implements Exception {
  const NoInternetConnectionException();

  @override
  String toString() {
    return LocaleKeys.error_no_internet.tr();
  }
}

class AppSystemException implements Exception {
  const AppSystemException();

  @override
  String toString() {
    return LocaleKeys.error_system.tr();
  }
}
