part of 'signup_user_cubit.dart';

@immutable
sealed class SignupUserState {}

final class SignupUserInitial extends SignupUserState {}

final class SignupUserLoading extends SignupUserState {}

final class SignupUserSuccess extends SignupUserState {
  final UserEntity userEntity;

  SignupUserSuccess({required this.userEntity});
}

final class SignupUserFailure extends SignupUserState {
  final String errorMessage;

  SignupUserFailure({required this.errorMessage});
}
