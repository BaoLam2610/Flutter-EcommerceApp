import 'package:equatable/equatable.dart';

import 'event_entity.dart';
import 'product_entity.dart';

class HomeEntity extends Equatable {
  final int totalSellingProducts;
  final List<EventEntity> events;
  final List<ProductEntity> products;

  const HomeEntity({
    required this.totalSellingProducts,
    required this.events,
    required this.products,
  });

  @override
  List<Object> get props => [totalSellingProducts, events, products];

  HomeEntity copyWith({
    int? totalSellingProducts,
    List<EventEntity>? events,
    List<ProductEntity>? products,
  }) {
    return HomeEntity(
      totalSellingProducts: totalSellingProducts ?? this.totalSellingProducts,
      events: events ?? this.events,
      products: products ?? this.products,
    );
  }
}
