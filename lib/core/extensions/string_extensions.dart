import 'package:sprintf/sprintf.dart';

extension StringExtension on String {
  String format(var arguments) => sprintf(this, arguments);
}

extension NullableStringExtension on String? {
  bool isNullOrEmpty() => this == null || this?.isEmpty == true;
}
