import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../utils/logger.dart';
import '../../constants/constants.dart';
import '../data_state.dart';
import 'model/data_response.dart';

class RestApiClient {
  static const String formUrlEncodedContentType =
      'application/json;charset=UTF-8';

  RestApiClient({
    required this.baseUrl,
    required this.interceptors,
    this.connectTimeout = AppDurations.defaultTimeout,
    this.sendTimeout = AppDurations.defaultTimeout,
    this.receiveTimeout = AppDurations.defaultTimeout,
  }) : _dio = _createDio(baseUrl, connectTimeout, sendTimeout, receiveTimeout) {
    _dio.interceptors.addAll(interceptors);
  }

  final Dio _dio;
  final String baseUrl;
  final List<Interceptor> interceptors;
  final Duration connectTimeout;
  final Duration sendTimeout;
  final Duration receiveTimeout;

  static Dio _createDio(
    String baseUrl,
    Duration connectTimeout,
    Duration sendTimeout,
    Duration receiveTimeout,
  ) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      contentType: formUrlEncodedContentType,
      responseType: ResponseType.json,
    );
    return Dio(options);
  }

  Options get _options => Options(headers: {});

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        path,
        options: _options,
        data: data,
        queryParameters: queryParameters,
      );
      if (response.statusCode == HttpStatus.ok) {
        onSuccess(response);
        return DataSuccess(response.data);
      }
    } on DioException catch (error) {
      return DataError(error);
    }
  }

  Future<DataState> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        options: _options,
        data: data,
        queryParameters: queryParameters,
      );
      if (response.statusCode == HttpStatus.ok) {
        onSuccess(response);
        return DataSuccess(response.data);
      }
      return const DataSuccess(null);
    } on DioException catch (error) {
      return DataError(error);
    }
  }

  dynamic onSuccess(Response<dynamic> response) async {
    // final data = response.data;
    // Log.info('response: $data');

    // final dataResponse = DataResponse.fromJson(data as Map<String, dynamic>);
    // Log.info('json from response : $json');
    // Log.info('data response : $dataResponse');
  }

// dynamic onError(DioException err) {
//   switch (err.type) {
//     case DioExceptionType.connectionTimeout:
//     case DioExceptionType.sendTimeout:
//     case DioExceptionType.receiveTimeout:
//       return DataError();
//     case DioExceptionType.badResponse:
//       switch (err.response?.statusCode) {
//         case 400:
//           throw BadRequestException(err.requestOptions);
//         case 401:
//           throw UnauthorizedException(err.requestOptions);
//         case 404:
//           throw NotFoundException(err.requestOptions);
//         case 409:
//           throw ConflictException(err.requestOptions);
//         case 500:
//           throw InternalServerErrorException(err.requestOptions);
//       }
//       break;
//     case DioExceptionType.cancel:
//       break;
//     case DioExceptionType.connectionError:
//       throw NoInternetConnectionException(err.requestOptions);
//     case DioExceptionType.badCertificate:
//     case DioExceptionType.unknown:
//       break;
//   }
// }

/*DataError<dynamic> onError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeOutException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        break;
    }
  }*/
}

/*

class DioErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    showDialogError(err);
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeOutException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        break;
    }
    return handler.next(err);
  }

  void showDialogError(DioException err) {
    switch (err.type) {
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 401:
            if (UserUtil.isLogin) {
              showDialogOut();
            }
            break;
          case 500:
            showDialogAnother(
              LocaleKeys.server_error.tr(),
            );
        }
        break;
      case DioExceptionType.connectionError:
        showDialogAnother(
          LocaleKeys.connection_error.tr(),
        );
        break;
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        showDialogAnother(
          LocaleKeys.server_error.tr(),
        );

        break;
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        showDialogAnother(
          LocaleKeys.server_error.tr(),
        );

        break;
      default:
        break;
    }
  }
}
*/
