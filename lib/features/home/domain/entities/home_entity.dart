import 'package:equatable/equatable.dart';

import 'event_entity.dart';
import 'product_entity.dart';

class HomeEntity extends Equatable {
  final List<EventEntity> events;
  final List<ProductEntity> products;

  const HomeEntity({
    required this.events,
    required this.products,
  });

  @override
  List<Object> get props => [events, products];

  HomeEntity copyWith({
    List<EventEntity>? events,
    List<ProductEntity>? products,
  }) {
    return HomeEntity(
      events: events ?? this.events,
      products: products ?? this.products,
    );
  }

  @override
  String toString() {
    return 'HomeEntity{events: $events, products: $products}';
  }
}
