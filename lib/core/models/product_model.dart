import 'dart:io';

import '../entities/product_entity.dart';
import 'reviews_model.dart';

class ProductModel {
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
  final List<ReviewsModel> reviews;
  ProductModel(
      {required this.name,
      required this.code,
      required this.price,
      required this.image,
      required this.isFeatured,
      required this.description,
      required this.expeireationMonths,
      required this.isOraganic,
      required this.numberOfCalories,
      required this.avgRating,
      required this.ratingCount,
      required this.unitAmount,
      required this.reviews,
      this.iamgeUrl});

  factory ProductModel.fromProductEntity(
      ProductEntity addProductInputEntity) {
    return ProductModel(
        reviews: addProductInputEntity.reviews
            .map((e) => ReviewsModel.fromReviewsEntity(e))
            .toList(),
        name: addProductInputEntity.name,
        code: addProductInputEntity.code,
        price: addProductInputEntity.price,
        image: addProductInputEntity.image,
        isFeatured: addProductInputEntity.isFeatured,
        description: addProductInputEntity.description,
        iamgeUrl: addProductInputEntity.iamgeUrl,
        expeireationMonths: addProductInputEntity.expeireationMonths,
        isOraganic: addProductInputEntity.isOraganic,
        numberOfCalories: addProductInputEntity.numberOfCalories,
        avgRating: addProductInputEntity.avgRating,
        ratingCount: addProductInputEntity.ratingCount,
        unitAmount: addProductInputEntity.unitAmount);
  }

  toJson() {
    return {
      "name": name,
      "code": code,
      "price": price,
      "iamgeUrl": iamgeUrl,
      "isFeatured": isFeatured,
      "description": description,
      "expeireationMonths": expeireationMonths,
      "isOraganic": isOraganic,
      "numberOfCalories": numberOfCalories,
      "avgRating": avgRating,
      "ratingCount": ratingCount,
      "unitAmount": unitAmount,
      "reviews": reviews
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
