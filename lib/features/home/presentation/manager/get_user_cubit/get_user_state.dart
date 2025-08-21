part of 'get_user_cubit.dart';

sealed class GetUserState  {
  const GetUserState();
}

final class GetUserInitial extends GetUserState {}

// create all state of get user
final class GetUserSuccess extends GetUserState {
  final UserEntity user;
  const GetUserSuccess({required this.user});
}

final class GetUserFailure extends GetUserState {
  final String errorMessage;
  const GetUserFailure({required this.errorMessage});
}

final class GetUserLoading extends GetUserState {}
