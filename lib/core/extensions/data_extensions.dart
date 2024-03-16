List<T>? castToList<T>(
  dynamic data,
  T Function(dynamic item) toElement,
) {
  return data == null ? null : (data as List).map<T>(toElement).toList();
}
