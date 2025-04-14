class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final String image;
  final String category;

  ProductModel({
    required this.image,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['category']['image'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      images: List<String>.from(json['images']),
      category: json['category']['name'],
    );
  }
}
