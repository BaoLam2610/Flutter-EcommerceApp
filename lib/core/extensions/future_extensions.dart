import 'dart:async';

Future<dynamic> postDelay({
  required int seconds,
  FutureOr<dynamic> Function()? computation,
}) async =>
    Future.delayed(Duration(seconds: seconds), computation);
