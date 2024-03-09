List<T>? castToList<T>(
  dynamic data,
  T Function(dynamic item) toElement,
) {
  // List<T> value =
  //     (json as List).map<T>(toElement).toList();
  return data == null ? null : (data as List).map<T>(toElement).toList();
}
