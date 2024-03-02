import '../../bloc/base_state.dart';
import '../data_state.dart';

abstract class NetworkUseCase<Params, Data> with CallApi<Data> {
  Future<Resource<Data>> call({Params params});
}

abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

mixin CallApi<T> {
  Future<Resource<T>> handleApi(
    DataState result,
  ) async {
    if (result is DataSuccess<T>) {
      return Success<T>(
        data: result.data,
        message: result.message,
      );
    }
    if (result is DataError) {
      return Error(
        message: result.exception.toString(),
      );
    }
    return None();
  }
}
