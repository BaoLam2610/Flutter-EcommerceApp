class Product {
  final String name;
  final List<String> image;
  final double rating;
  final String description;
  final bool isFavorite;
  Product({
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    this.isFavorite = false,
  });
}
