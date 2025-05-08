import '../config/config.dart';

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final ProductCategory category;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
  });
}