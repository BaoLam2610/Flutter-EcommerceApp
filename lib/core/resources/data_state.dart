abstract class DataState {
  final dynamic data;
  final String? errorMessage;
  final Exception? exception;

  const DataState({
    this.data,
    this.errorMessage,
    this.exception,
  });
}

class DataSuccess extends DataState {
  const DataSuccess(dynamic data) : super(data: data);
}

class DataError extends DataState {
  const DataError({
    Exception? exception,
  }) : super(
          exception: exception,
        );
}
