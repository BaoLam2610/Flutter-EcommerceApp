abstract class DataState<T> {
  final T? data;
  final String? message;
  final Exception? exception;

  const DataState({
    this.data,
    this.message,
    this.exception,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({T? data, String? message})
      : super(
          data: data,
          message: message,
        );
}

class DataError<T> extends DataState<T> {
  const DataError({
    Exception? exception,
  }) : super(
          exception: exception,
        );
}
