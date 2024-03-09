import '../../../../core/core.dart';
import '../../../../utils/utils.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/entities/product_entity.dart';
import 'event_dto.dart';
import 'product_dto.dart';

class HomeDto extends HomeEntity {
  HomeDto({
    List<EventEntity>? events,
    List<ProductEntity>? products,
  }) : super(
          events: events ?? [],
          products: products ?? [],
        );

  factory HomeDto.fromJson(Map<String, dynamic> json) {
    return HomeDto(
      events: castToList<EventDto>(
        json['events'],
        (item) => EventDto.fromJson(item),
      ),
      products: castToList<ProductDto>(
        json['products'],
        (item) => ProductDto.fromJson(item),
      ),
    );
  }
}
