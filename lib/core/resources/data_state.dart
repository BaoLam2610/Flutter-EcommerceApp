import 'package:dio/dio.dart';

abstract class DataState {
  final dynamic data;
  final DioException? error;

  const DataState({
    this.data,
    this.error,
  });
}

class DataSuccess extends DataState {
  const DataSuccess(dynamic data) : super(data: data);
}

class DataError extends DataState {
  const DataError(DioException error) : super(error: error);
}