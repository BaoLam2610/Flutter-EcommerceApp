import '../../domain/entities/product_entity.dart';

class ProductDto extends ProductEntity {
  const ProductDto({
    String? id,
    String? name,
    String? code,
    double? price,
    double? discountPrice,
    String? imageUrl,
  }) : super(
          id: id ?? '',
          name: name ?? '',
          code: code ?? '',
          price: price ?? 0.0,
          discountPrice: discountPrice ?? 0.0,
          imageUrl: imageUrl ?? '',
        );

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'],
      name: json['productName'],
      code: json['productCode'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      imageUrl: json['imageOne'],
    );
  }
}
