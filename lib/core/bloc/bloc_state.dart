import 'package:equatable/equatable.dart';

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

class StatusState extends Equatable {
  final Status status;
  final dynamic data;
  final String? message;

  const StatusState({
    this.status = Status.initialize,
    this.data,
    this.message,
  });

  StatusState copyWith({
    Status? status,
    dynamic data,
    String? message,
  }) {
    return StatusState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, data, message];
}

enum Status { initialize, loading, success, error }
