class PopularProduct {
  final String id;
  final String image;
  final String name;
  final double price;
  bool isFavorite;

  PopularProduct({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    this.isFavorite = false,
  });
}
