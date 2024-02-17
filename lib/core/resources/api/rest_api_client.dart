import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../data_state.dart';
import 'model/data_response.dart';
import 'model/network_exception.dart';

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

  Future<DataState<T>> post<T>(
    String path, {
    required void Function(Map<String, dynamic> json) create,
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
        return _onSuccess(response, create);
      }
      return _systemAppError();
    } on DioException catch (e) {
      return _onError(e);
    }
  }

  Future<DataState<T>> get<T>(
    String path, {
    required void Function(Map<String, dynamic> json) create,
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
        return _onSuccess(response, create);
      }
      return _systemAppError();
    } on DioException catch (e) {
      return _onError(e);
    }
  }
}

extension RestApiClientExtension on RestApiClient {
  DataSuccess<T> _onSuccess<T>(
      Response<dynamic> response,
      Function(Map<String, dynamic>) create,
      ) {
    final data = response.data;
    final dataResponse =
    DataResponse.fromJson(data as Map<String, dynamic>, create);
    return DataSuccess<T>(
      data: dataResponse.data,
      message: dataResponse.message,
    );
  }

  DataError<T> _systemAppError<T>() => const DataError(
    exception: AppSystemException(),
  );

  DataError<T> _onError<T>(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const DataError(
          exception: ConnectionTimeOutException(),
        );
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            return DataError(
              exception: BadRequestException(err),
            );
          case 401:
            return const DataError(
              exception: UnauthorizedException(),
            );
          case 404:
            return const DataError(
              exception: NotFoundException(),
            );
          case 500:
            return const DataError(
              exception: InternalServerErrorException(),
            );
          default:
            return _systemAppError();
        }
      case DioExceptionType.connectionError:
        return const DataError(
          exception: NoInternetConnectionException(),
        );
      default:
        return _systemAppError();
    }
  }
}
