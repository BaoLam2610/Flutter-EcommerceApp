class PopularProduct {
  final String image;
  final String name;
  final double price;
  final bool isFavorite;

  PopularProduct({
    required this.image,
    required this.name,
    required this.price,
    this.isFavorite = false,
  });
}
