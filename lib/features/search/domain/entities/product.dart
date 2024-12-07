import 'package:equatable/equatable.dart';

abstract class Product extends Equatable {
  final String name;
  final String id;
  final String imageUrl;
  final String description;

  const Product(
      {required this.name,
      required this.id,
      required this.imageUrl,
      required this.description});
  @override
  bool? get stringify => true;
}
