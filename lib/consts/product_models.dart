// models/product_model.dart
class Product {
  final String id;
  final String name;
  final String image;
  final String category;
  final String description;
  final double price;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
  });
}
