import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../gen/gen.dart';
import '../../core.dart';

class RestApiClient {
  static const String formUrlEncodedContentType =
      'application/json;charset=UTF-8';

  static const String authorization = 'Authorization';

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

  Options get _options {
    final Map<String, dynamic> headers = {};
    final accessToken = PrefUtil.instance.getString(AppKeys.accessToken);
    if (!accessToken.isNullOrEmpty) {
      headers[authorization] = 'Bearer $accessToken';
    }
    return Options(headers: headers);
  }

  Future<DataResponse> post(
    String path, {
    void Function(dynamic json)? create,
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
        return _onSuccessReturn(response, create);
      }
      throw Exception(LocaleKeys.error_system.tr());
    } catch (e) {
      rethrow;
    }
  }

  Future<DataResponse> get(
    String path, {
    void Function(dynamic json)? create,
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
        return _onSuccessReturn(response, create);
      }
      throw Exception(LocaleKeys.error_system.tr());
    } catch (e) {
      rethrow;
    }
  }

  DataResponse _onSuccessReturn(
    Response<dynamic> response,
    Function(dynamic json)? create,
  ) {
    final data = response.data;
    final dataResponse = DataResponse.fromJson(data, create);
    return dataResponse;
  }
}
