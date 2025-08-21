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

final class EditUserImageLoading extends UserState {
}
