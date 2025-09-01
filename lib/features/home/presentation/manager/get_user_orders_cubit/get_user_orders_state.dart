part of 'get_user_orders_cubit.dart';

sealed class GetUserOrdersState {
  const GetUserOrdersState();
}

final class GetUserOrdersInitial extends GetUserOrdersState {}

// create all State of get user orders;
final class GetUserOrdersSuccess extends GetUserOrdersState {
  final List<MyOrdersEntity> ordersList;
  const GetUserOrdersSuccess({required this.ordersList});
}

final class GetUserOrdersFailure extends GetUserOrdersState {
  final String errorMessage;
  const GetUserOrdersFailure({required this.errorMessage});
}

final class GetUserOrdersLoading extends GetUserOrdersState {}
