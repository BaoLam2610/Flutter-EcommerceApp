import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/entities/home_entity.dart';
import 'event_dto.dart';

class HomeDto extends HomeEntity {
  HomeDto({
    int? totalSellingProducts,
    List<EventEntity>? events,
    List<ProductEntity>? products,
  }) : super(
          totalSellingProducts: totalSellingProducts ?? 0,
          events: events ?? [],
          products: products ?? [],
        );

  factory HomeDto.fromJson(Map<String, dynamic> json) {
    return HomeDto(
      totalSellingProducts: json['totalSellingProducts'],
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
