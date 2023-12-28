sealed class BlocState {}

class Initialize extends BlocState {}

class Loading extends BlocState {}

class Success<T> extends BlocState {
  final T? data;
  final String? message;

  Success({
    this.data,
    this.message,
  });
}

class Error extends BlocState {
  final String message;

  Error({required this.message});
}