import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_entity.dart';
import 'package:fruits_hub/features/home/domain/repos/home_repo.dart';

part 'get_user_orders_state.dart';

class GetUserOrdersCubit extends Cubit<GetUserOrdersState> {
  GetUserOrdersCubit({required this.homeRepo}) : super(GetUserOrdersInitial());

  final HomeRepo homeRepo;
  StreamSubscription? _streamSubscription;
  // create method that get user orders;
  void getUserOrders() {
    emit(GetUserOrdersLoading());
    _streamSubscription = homeRepo.getUserOrders().listen(
      (event) {
        event.fold(
          (failure) {
            _streamSubscription!.cancel();
            emit(
              GetUserOrdersFailure(errorMessage: failure.errorMessage),
            );
          },
          (orders) {
            emit(
              GetUserOrdersSuccess(ordersList: orders),
            );
          },
        );
      },
    );
  }

  // close stream
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
