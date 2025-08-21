import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/domain/repos/home_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.homeRepo}) : super(UserInitial());

  final HomeRepo homeRepo;

  //create method that handel state of update user image
  Future<void> updateUserImage({required File file}) async {
    emit(EditUserImageLoading());
    final result = await homeRepo.uploadUserImage(file: file);
    result.fold(
      (failure) => emit(
        EditUserImageFailure(errorMessage: failure.errorMessage),
      ),
      (url) => emit(
        EditUserImageSuccess(imageUrl: url),
      ),
    );
  }
}
