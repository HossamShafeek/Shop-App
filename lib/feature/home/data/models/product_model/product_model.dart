import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String categoryName;
  final String description;
  final List<String> images;
  final num price;
  final int quantity;

  const ProductModel({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.description,
    required this.images,
    required this.price,
    required this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      categoryName: json['category_name'],
      description: json['description'],
      images: json['images'].cast<String>(),
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category_name': categoryName,
        'description': description,
        'images': images,
        'price': price,
        'quantity': quantity,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        categoryName,
        description,
        images,
        price,
        quantity,
      ];
}
