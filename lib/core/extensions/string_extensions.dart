import 'package:sprintf/sprintf.dart';

extension StringExtension on String {
  String format(String arguments) => sprintf(this, [arguments]);
}