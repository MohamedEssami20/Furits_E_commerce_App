part of 'get_user_orders_cubit.dart';

sealed class GetUserOrdersState extends Equatable {
  const GetUserOrdersState();
}

@override
List<Object?> get props => [];

final class GetUserOrdersInitial extends GetUserOrdersState {
  @override
  List<Object?> get props => [];
}

// create all State of get user orders;
final class GetUserOrdersSuccess extends GetUserOrdersState {
  final List<MyOrdersEntity> ordersList;
  const GetUserOrdersSuccess({required this.ordersList});

  @override
  List<Object?> get props => [ordersList];
}

final class GetUserOrdersFailure extends GetUserOrdersState {
  final String errorMessage;
  const GetUserOrdersFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class GetUserOrdersLoading extends GetUserOrdersState {
  @override
  List<Object?> get props => [];
}
