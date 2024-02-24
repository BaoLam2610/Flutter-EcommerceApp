import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

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

class Error extends BlocState {
  final String message;

  Error({required this.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Error &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

extension BlocStateExtension on BlocState {
  void observeData<T>(
    BuildContext context, {
    void Function(T? data, String? message)? onSuccess,
    void Function(String? error)? onError,
  }) {
    if (this is Success<T>) {
      AppLoading.hideLoading();
      final success = this as Success<T>;
      onSuccess?.call(success.data, success.message);
    } else if (this is Error) {
      final error = this as Error;
      AppLoading.hideLoading();
      AppDialog.showOkDialog(context: context, content: error.message);
      onError?.call(error.message);
    } else if (this is Loading) {
      AppLoading.showLoading();
    }
  }

  void observeDataDynamic(
    BuildContext context, {
    void Function(dynamic data, String? message)? onSuccess,
    void Function(String? error)? onError,
  }) {
    observeData<dynamic>(context, onSuccess: onSuccess, onError: onError);
  }
}
