import 'dart:io';

import 'reviews_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final num price;
  final File image;
  final bool isFeatured;
  final String description;
  String? iamgeUrl;
  final int expeireationMonths;
  final bool isOraganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewsEntity> reviews;
  ProductEntity({
    required this.name,
    required this.code,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.description,
    this.iamgeUrl,
    required this.expeireationMonths,
    this.isOraganic = false,
    required this.numberOfCalories,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.unitAmount,
    required this.reviews,
  });
}
