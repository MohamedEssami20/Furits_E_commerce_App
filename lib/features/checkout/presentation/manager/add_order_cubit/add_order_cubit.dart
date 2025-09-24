import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';

import '../../../domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit({required this.ordersRepo}) : super(AddOrderInitial());
  final OrdersRepo ordersRepo;

  // create method that add order form order repos;
  Future<void> addOrder(
      {required OrderEntity ordereEntity,
      required String genralErrorMessage}) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(
        ordereEntity: ordereEntity, genralErrorMessage: genralErrorMessage);
    result.fold(
      (error) => emit(
        AddOrderError(message: error.errorMessage),
      ),
      (success) => emit(
        AddOrderSuccess(),
      ),
    );
  }
}
