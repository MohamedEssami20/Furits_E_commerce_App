import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';

abstract class ProductRepos {
  //create method that get product from firebase;
  Future<Either<Failure, List<ProductEntity>>> getProduct({required String genralErrorMessage});
  // create method that get best selling product from firebase;
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct({required String genralErrorMessage});

  // create method that add product to favorites into database as Stream;
  Future<Either<Failure, void>> addToFavorites({required String productId, required String genralErrorMessage});

  // create method that get favorites products from database as Stream;
  Stream<Either<Failure, List<ProductEntity>>> getFavoritesProducts({required String genralErrorMessage});

  // create method that remove product from favorites into database as Stream;
  Future<Either<Failure, void>> removeFavoriteProduct(
      {required String productId, required String genralErrorMessage});
}
