import 'package:sup_labs_task/features/search/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.title,
      required super.id,
      required super.imageUrl,
      required super.description,
      required super.rating,
      required super.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      id: json['id'].toString(),
      rating: json['rating']['rate'],
      imageUrl: json['image'],
      price: json['price'].toString(),
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [title, id, imageUrl, description, price];
}
