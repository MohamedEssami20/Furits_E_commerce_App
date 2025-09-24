import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';

import '../../../../../core/entities/product_entity.dart';

part 'get_favorite_product_state.dart';

class GetFavoriteProductCubit extends Cubit<GetFavoriteProductState> {
  GetFavoriteProductCubit({required this.productRepos})
      : super(GetFavoriteProductInitial());
  final ProductRepos productRepos;
  StreamSubscription? streamSubscription;
  List<ProductEntity> favoriteProducts = [];

  // create method that get favorite products as stream;
  void getFavoriteProducts({required String genralErrorMessage}) {
    emit(GetFavoriteProductsLoading());
    streamSubscription = productRepos
        .getFavoritesProducts(genralErrorMessage: genralErrorMessage)
        .listen((event) {
      log("new event is work = $event");
      event.fold(
        (l) => emit(
          GetFavoriteProductsFailure(errormessage: l.errorMessage),
        ),
        (r) {
          favoriteProducts.clear();
          favoriteProducts.addAll(r);
          emit(
            GetFavoriteProductsSuccess(products: r),
          );
        },
      );
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
