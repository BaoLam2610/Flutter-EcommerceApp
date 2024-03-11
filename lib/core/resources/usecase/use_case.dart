import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../gen/gen.dart';
import '../../core.dart';

abstract class NetworkUseCase<Params, Data> with CallApi<Data> {
  Future<Resource<Data>> call({Params params});
}

abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

mixin CallApi<T> {
  Future<Resource<T>> handleApi(
    Future<DataResponse> dataCallBack,
  ) async {
    try {
      final response = await dataCallBack;
      if (response.isSuccess) {
        return Success<T>(
          data: response.data,
          message: response.message,
          pageResult: response.pageResult,
        );
      }
      return Error<T>(message: response.message);
    } on DioException catch (e) {
      return _handleNetworkException(e);
    }
  }

  Resource<T> _handleNetworkException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Error(
          message: const ConnectionTimeOutException().toString(),
        );
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            return Error(
              message: BadRequestException(err).toString(),
            );
          case 401:
            return const Unauthorized();
          case 404:
            return Error(
              message: const NotFoundException().toString(),
            );
          case 500:
            return Error(
              message: const InternalServerErrorException().toString(),
            );
          default:
            return Error(message: LocaleKeys.error_system.tr());
        }
      case DioExceptionType.connectionError:
        return Error(
          message: const NoInternetConnectionException().toString(),
        );
      default:
        return Error(message: LocaleKeys.error_system.tr());
    }
  }
}
