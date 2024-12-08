import 'package:equatable/equatable.dart';

abstract class Product extends Equatable {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final String price;
  final num rating;
  const Product(
      {required this.title,
      required this.id,
      required this.price,
      required this.imageUrl,
      required this.rating,
      required this.description});
  @override
  bool? get stringify => true;
}

extension GetStrikedPrice on Product {
  String getStrikedPrice() {
    final pr = double.tryParse(price);
    if (pr != null) {
      return (pr * 1.4).toStringAsFixed(2);
    } else {
      return price;
    }
  }
}
