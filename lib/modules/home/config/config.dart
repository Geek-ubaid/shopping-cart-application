import '../models/product.dart';

enum ProductCategory { men, women }

final List<Product> products = [
    Product(
      id: '1',
      name: 'Men Kurta',
      imageUrl: 'assets/images/men_image_1.jpeg',
      price: 199,
      category: ProductCategory.men
    ),
    Product(
      id: '2',
      name: 'Men Kurta',
      imageUrl: 'assets/images/men_image_2.webp',
      price: 299,
      category: ProductCategory.men,
    ),
    Product(
      id: '3',
      name: 'Men Kurta',
      imageUrl: 'assets/images/men_image_3.jpeg',
      price: 149,
      category: ProductCategory.men,
    ),
    Product(
      id: '4',
      name: 'Men Kurta',
      imageUrl: 'assets/images/men_image_4.jpg',
      price: 179,
      category: ProductCategory.men,
    ),
    Product(
      id: '5',
      name: 'Women Kurta',
      imageUrl: 'assets/images/women_image_1.webp',
      price: 199,
      category: ProductCategory.women
    ),
    Product(
      id: '6',
      name: 'Women Kurta',
      imageUrl: 'assets/images/women_image_2.webp',
      price: 299,
      category: ProductCategory.women,
    ),
    Product(
      id: '7',
      name: 'Women Kurta',
      imageUrl: 'assets/images/women_image_3.webp',
      price: 149,
      category: ProductCategory.women,
    ),
    Product(
      id: '8',
      name: 'Women Kurta',
      imageUrl: 'assets/images/women_image4.jpeg',
      price: 179,
      category: ProductCategory.women,
    ),
  ];
