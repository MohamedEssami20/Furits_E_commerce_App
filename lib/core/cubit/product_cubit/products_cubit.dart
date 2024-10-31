import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';
import 'package:meta/meta.dart';

import '../../errors/failure.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepos) : super(ProductsInitial());
  final ProductRepos productRepos;

  // create method to get products;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    Either<Failure, List<ProductEntity>> result = await productRepos.getProduct();
    result.fold(
      (failure) => emit(ProductsFailure(errormessage:  failure.errorMessage)),
      (products) => emit(ProductsSuccess(products:  products)),
    );
  }

  //create metod to get best selling products
  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    Either<Failure, List<ProductEntity>> result =
        await productRepos.getBestSellingProduct();
    result.fold(
      (failure) => emit(ProductsFailure(errormessage:  failure.errorMessage)),
      (products) => emit(ProductsSuccess(products:  products)),
    );
  }
}
