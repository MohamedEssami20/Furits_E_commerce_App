import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';

abstract class ProductRepos {
  //create method that get product from firebase;
  Future<Either<Failure, List<ProductEntity>>> getProduct();
  // create method that get best selling product from firebase;
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct();

  // create method that add product to favorites into database;
  Future<Either<Failure, void>> addToFavorites({required ProductEntity product});
}
