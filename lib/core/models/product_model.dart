import 'dart:io';
import 'package:fruits_hub/core/entities/product_entity.dart';

import 'reviews_model.dart';

class ProductModel {
  final String productId;
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
  final int sellingCount;
  final List<ReviewsModel> reviews;
  ProductModel(
      {required this.productId,required this.name,
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
      this.sellingCount = 0,
      this.iamgeUrl});

  factory ProductModel.formJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json["productId"],
      image: File(json["iamgeUrl"]),
      name: json["name"],
      code: json["code"],
      price: json["price"],
      iamgeUrl: json["iamgeUrl"],
      isFeatured: json["isFeatured"],
      description: json["description"],
      expeireationMonths: json["expeireationMonths"],
      isOraganic: json["isOraganic"],
      numberOfCalories: json["numberOfCalories"],
      avgRating: json["avgRating"],
      ratingCount: json["ratingCount"],
      unitAmount: json["unitAmount"],
      reviews: json["reviews"] == null
          ? []
          : List<ReviewsModel>.from(
              json["reviews"].map(
                (e) => ReviewsModel.fromJson(e),
              ),
            ),
      sellingCount: json["sellingCount"]?.toInt() ?? 0,
    );
  }

  factory ProductModel.fromProductEntity(ProductEntity product) {
    return ProductModel(
      productId: product.id,
      image: product.image,
      name: product.name,
      code: product.code,
      price: product.price,
      iamgeUrl: product.iamgeUrl,
      isFeatured: product.isFeatured,
      description: product.description,
      expeireationMonths: product.expeireationMonths,
      isOraganic: product.isOraganic,
      numberOfCalories: product.numberOfCalories,
      avgRating: product.avgRating,
      ratingCount: product.ratingCount,
      unitAmount: product.unitAmount,
      reviews: product.reviews
          .map((e) => ReviewsModel.fromReviewsEntity(e))
          .toList(),
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: productId,
      image: image,
      name: name,
      code: code,
      price: price,
      iamgeUrl: iamgeUrl,
      isFeatured: isFeatured,
      description: description,
      expeireationMonths: expeireationMonths,
      isOraganic: isOraganic,
      numberOfCalories: numberOfCalories,
      avgRating: avgRating,
      ratingCount: ratingCount,
      unitAmount: unitAmount,
      reviews: reviews
          .map(
            (e) => e.toEntity(),
          )
          .toList(),
    );
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
      "sellingCount": sellingCount,
    };
  }
}
