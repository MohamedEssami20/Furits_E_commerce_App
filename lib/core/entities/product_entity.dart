import 'dart:io';
import 'package:equatable/equatable.dart';


// ignore: must_be_immutable
class ProductEntity extends Equatable {
  final String id;
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
  final bool isFavorite;
  ProductEntity({
    this.isFavorite = false,
    required this.id,
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
    required this.ratingCount,
    this.sellingCount = 0,
    required this.unitAmount,
  });

  @override
  List<Object?> get props => [code, id];
}
