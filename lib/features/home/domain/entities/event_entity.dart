import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final String id;
  final String title;
  final String content;
  final String bannerUrl;

  const EventEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.bannerUrl,
  });

  @override
  List<Object> get props => [id, title, content, bannerUrl];

  EventEntity copyWith({
    String? id,
    String? title,
    String? content,
    String? bannerUrl,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      bannerUrl: bannerUrl ?? this.bannerUrl,
    );
  }

  @override
  String toString() {
    return 'EventEntity{id: $id, title: $title, content: $content, bannerUrl: $bannerUrl}';
  }
}
