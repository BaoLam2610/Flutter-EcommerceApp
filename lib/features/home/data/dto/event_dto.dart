import '../../domain/entities/event_entity.dart';

class EventDto extends EventEntity {
  const EventDto({
    String? id,
    String? title,
    String? content,
    String? bannerUrl,
  }) : super(
          id: id ?? '',
          title: title ?? '',
          content: content ?? '',
          bannerUrl: bannerUrl ?? '',
        );

  factory EventDto.fromJson(Map<String, dynamic> json) {
    return EventDto(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      bannerUrl: json['bannerUrl'],
    );
  }
}
