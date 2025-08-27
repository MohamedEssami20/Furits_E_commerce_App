import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/domain/entities/edit_user_info_entity.dart';
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

  // create methodt that handel state of update user info
  Future<void> updateUserInfo(
      {required EditUserInfoEntity userInfoEntity}) async {

        // update user name
    if(userInfoEntity.name != null && userInfoEntity.name!.isNotEmpty) {
      emit(EditUserNameLoading());
      final result = await homeRepo.updateName(name: userInfoEntity.name!);
      result.fold(
        (failure) => emit(
          EditUserNameFailure(errorMessage: failure.errorMessage),
        ),
        (_) => emit(
          EditUserNameSuccess(),
        ),
      );
    }

    // update user email
    if(userInfoEntity.email != null && userInfoEntity.email!.isNotEmpty) {
      emit(EditUserEmailLoading());
      final result = await homeRepo.updateEmail(
        newEmail: userInfoEntity.email!,
        oldPassword: userInfoEntity.oldPassword!,
      );
      result.fold(
        (failure) => emit(
          EditUserEmailFailure(errorMessage: failure.errorMessage),
        ),
        (_) => emit(
          EditUserEmailSuccess(),
        ),
      );
    }

    // update user password 
    if(userInfoEntity.newPassword != null && userInfoEntity.newPassword!.isNotEmpty) {
      emit(EditUserPasswordLoading());
      final result = await homeRepo.updatePassword(
        newPassword: userInfoEntity.newPassword!,
        oldPassword: userInfoEntity.oldPassword!,
      );
      result.fold(
        (failure) => emit(
          EditUserPasswordFailure(errorMessage: failure.errorMessage),
        ),
        (_) => emit(
          EditUserPasswordSuccess(),
        ),
      );
    }
  }
}
