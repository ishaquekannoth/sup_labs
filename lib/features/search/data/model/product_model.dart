import 'package:sup_labs_task/features/search/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.name,
    required super.id,
    required super.imageUrl,
    required super.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [name, id, imageUrl, description];
}

class ProductModelModel extends ProductModel {
  const ProductModelModel({
    required super.name,
    required super.id,
    required super.imageUrl,
    required super.description,
  });

  factory ProductModelModel.fromJson(Map<String, dynamic> json) {
    return ProductModelModel(
      name: json['name'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}
