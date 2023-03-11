class ProductModel {
  factory ProductModel.fromJson({required Map<String, dynamic> json}) {
    return ProductModel(
      id: json['id'].toString(),
      title: json["title"],
      price: json["price"].toString(),
      category: json["category"],
      description: json['description'],
      imageUrl: json['image'],
      rating: json['rating']['rate'].toString(),
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['category'] = category;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['rating'] = rating;
    return data;
  }

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });
  final String id;
  final String title;
  final String price;
  final String category;
  final String description;
  final String imageUrl;
  final String rating;
}
