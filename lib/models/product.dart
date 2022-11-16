import 'package:flutter/material.dart';

//freezed使って実装したい
class Product {
  final String id;
  final String title;
  final String description;
  final int price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });

  Product copyWith(
      {String? id,
      String? title,
      String? description,
      int? price,
      String? imageUrl,
      bool? isFavorite}) {
    return Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        price: price ?? this.price,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
