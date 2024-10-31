import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';

class ProductRepoImpl extends ProductRepos {
  final DataBaseService dataBaseService;

  ProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, ProductEntity>> getBestSellingProduct() {
    // TODO: implement getBestSellingProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}
