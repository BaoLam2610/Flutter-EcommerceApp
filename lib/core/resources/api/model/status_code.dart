class StatusCode {
  final int value;
  final String description;

  const StatusCode({
    required this.value,
    required this.description,
  });

  factory StatusCode.fromJson(Map<String, dynamic> map) {
    return StatusCode(
      value: map['value'] as int,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'description': description,
    };
  }
}