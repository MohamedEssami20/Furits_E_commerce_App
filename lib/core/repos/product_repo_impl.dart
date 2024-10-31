import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';

import '../utils/backend_endpoints.dart';

class ProductRepoImpl extends ProductRepos {
  final DataBaseService dataBaseService;

  ProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, ProductEntity>> getBestSellingProduct() {
    // TODO: implement getBestSellingProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      var data = await dataBaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.formJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(
          errorMessage: "there was an error when fetching products"));
    }
  }
}
