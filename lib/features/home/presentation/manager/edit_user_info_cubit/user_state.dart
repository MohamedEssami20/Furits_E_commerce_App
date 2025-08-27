part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

// create all state of update user image;

final class EditUserImageSuccess extends UserState {
  final String imageUrl;
  const EditUserImageSuccess({required this.imageUrl});
}

final class EditUserImageFailure extends UserState {
  final String errorMessage;
  const EditUserImageFailure({required this.errorMessage});
}

final class EditUserImageLoading extends UserState {}

// create all state of update user name;

final class EditUserNameSuccess extends UserState {}

final class EditUserNameFailure extends UserState {
  final String errorMessage;
  const EditUserNameFailure({required this.errorMessage});
}

final class EditUserNameLoading extends UserState {}

// create all state of update user email;

final class EditUserEmailSuccess extends UserState {}

final class EditUserEmailFailure extends UserState {
  final String errorMessage;
  const EditUserEmailFailure({required this.errorMessage});
}

final class EditUserEmailLoading extends UserState {}

// create all state of update user password;

final class EditUserPasswordSuccess extends UserState {}

final class EditUserPasswordFailure extends UserState {
  final String errorMessage;
  const EditUserPasswordFailure({required this.errorMessage});
}

final class EditUserPasswordLoading extends UserState {}
