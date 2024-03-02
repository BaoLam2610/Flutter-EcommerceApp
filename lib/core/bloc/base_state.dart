import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class BaseState extends Equatable {
  final Resource status;

  const BaseState({required this.status});

  @override
  List<Object> get props => [status];

  BaseState copyWith({
    Resource? status,
  }) {
    return BaseState(
      status: status ?? this.status,
    );
  }
}

class Resource<T> {
  final T? data;
  final String? message;

  const Resource({this.data, this.message});
}

class None<T> extends Resource<T> {}

class Initialize extends Resource {}

class Loading extends Resource {}

class Success<T> extends Resource<T> {
  Success({
    super.data,
    super.message,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          message == other.message;

  @override
  int get hashCode => data.hashCode ^ message.hashCode;
}

class Error<T> extends Resource<T> {
  Error({super.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Error &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

extension BaseStateExtension on BaseState {
  void observeData<T>(
    BuildContext context, {
    void Function(T? data, String? message)? onSuccess,
    void Function(String? error)? onError,
  }) {
    if (status is Success<T>) {
      AppLoading.hideLoading();
      final success = status as Success<T>;
      onSuccess?.call(success.data, success.message);
      return;
    }
    if (status is Error<T>) {
      final error = status as Error<T>;
      AppLoading.hideLoading();
      AppDialog.showOkDialog(context: context, content: error.message);
      onError?.call(error.message);
      return;
    }
    if (status is Loading) {
      AppLoading.showLoading();
    }
  }
}
