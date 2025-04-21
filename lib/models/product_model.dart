class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  final String brand;
  final List<String> images;

  ProductModel({
    required this.images,
    required this.image,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      price: (json['price'] ?? 0).toDouble(),
      image: json['thumbnail'] ?? '',
      category: json['category'] ?? 'Uncategorized',
      brand: json['brand'] ?? 'Unknown brand',
      images:
          (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}
