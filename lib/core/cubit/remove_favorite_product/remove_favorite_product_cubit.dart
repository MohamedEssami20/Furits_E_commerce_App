import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';

part 'remove_favorite_product_state.dart';

class RemoveFavoriteProductCubit extends Cubit<RemoveFavoriteProductState> {
  RemoveFavoriteProductCubit({required this.productRepos})
      : super(RemoveFavoriteProductInitial());

  final ProductRepos productRepos;
  String? currentProductId;
  // create methodt that remove favorite product;
  Future<void> removeFavoriteProduct({required String productId}) async {
    emit(RemoveFavoriteProductLoading());
    final result =
        await productRepos.removeFavoriteProduct(productId: productId);
    result.fold(
      (l) => emit(RemoveFavoriteProductError(errorMessage: l.errorMessage)),
      (r) {
        currentProductId = productId;
        emit(
          RemoveFavoriteProductSuccess(),
        );
      },
    );
  }
}
