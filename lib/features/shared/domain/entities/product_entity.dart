import 'package:equatable/equatable.dart';

import '../../../../../core/extensions/number_extensions.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String code;
  final double price;
  final double discountPrice;
  final String imageUrl;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.price,
    required this.discountPrice,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [
        id,
        name,
        code,
        price,
        discountPrice,
        imageUrl,
      ];

  ProductEntity copyWith({
    String? id,
    String? name,
    String? code,
    double? price,
    double? discountPrice,
    String? imageUrl,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  String get displayProduct => '$name - $code';

  String get textPrice => price.formatCurrency;

  String get textDiscountPrice => price.formatCurrency;

  @override
  String toString() {
    return 'ProductEntity{id: $id, name: $name, code: $code, price: $price, discountPrice: $discountPrice, imageUrl: $imageUrl}';
  }
}
