import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../core.dart';

class BaseState extends Equatable {
  final Resource status;

  const BaseState({required this.status});

  @override
  List<Object?> get props => [status];
}

class Resource<T> extends Equatable {
  final T? data;
  final String? message;
  final PageResult? pageResult;

  const Resource({this.data, this.message, this.pageResult});

  @override
  List<Object?> get props => [data, message, pageResult];
}

class None<T> extends Resource<T> {}

class Initialize extends Resource {}

class Loading extends Resource {}

class Success<T> extends Resource<T> {
  const Success({
    super.data,
    super.message,
    super.pageResult,
  });
}

class Error<T> extends Resource<T> {
  const Error({super.message});
}

class Unauthorized<T> extends Resource<T> {
  const Unauthorized();
}

extension BaseStateExtension on BaseState {
  void listenerUnauthorized(BuildContext context) {
    if (status is Unauthorized) {
      AppLoading.hideLoading();
      AppDialog.showLogoutDialog(context: context).then(
        (value) async {
          await PrefUtil.instance.logOut();
          if (context.mounted) {
            return context.navigator
                .pushReplacementNamed(AppRoutes.splashRoute);
          }
        },
      );
    }
  }

  void listenData<T>(
    BuildContext context, {
    void Function(T? data, String? message)? onSuccess,
    void Function(String? error)? onError,
  }) {
    if (status is Loading) {
      AppLoading.showLoading();
      return;
    }
    if (status is Success<T>) {
      AppLoading.hideLoading();
      onSuccess?.call(status.data, status.message);
      return;
    }
    if (status is Error<T>) {
      AppLoading.hideLoading();
      AppDialog.showOkDialog(context: context, content: status.message);
      onError?.call(status.message);
      return;
    }
    listenerUnauthorized(context);
  }
}
