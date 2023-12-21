
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_state.freezed.dart';

@freezed
abstract class CustomState<T> with _$CustomState<T> {
  const factory CustomState.init() = Init;
  const factory CustomState.loading() = Loading;
  const factory CustomState.success(T? data, String? message) = Success<T>;
  const factory CustomState.error(String? error) = Error;
}
