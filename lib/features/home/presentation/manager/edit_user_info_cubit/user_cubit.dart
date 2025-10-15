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
  Future<void> updateUserImage(
      {required File file, required String genralErrorMessage}) async {
    emit(EditUserImageLoading());
    final result = await homeRepo.uploadUserImage(
        file: file, genralErrorMessage: genralErrorMessage);
    result.fold(
        (failure) => emit(
              EditUserImageFailure(errorMessage: failure.errorMessage),
            ), (url) async {
      await homeRepo.updateUserNameAndUserImageInAllReviews(
        userName: null,
        userImage: url,
      );
      emit(
        EditUserImageSuccess(imageUrl: url),
      );
    });
  }

  // create methodt that handel state of update user info
  Future<void> updateUserInfo(
      {required EditUserInfoEntity userInfoEntity,
      required String genralErrorMessage}) async {
    // update user name
    if (userInfoEntity.name != null && userInfoEntity.name!.isNotEmpty) {
      emit(EditUserNameLoading());
      final result = await homeRepo.updateName(
          name: userInfoEntity.name!, genralErrorMessage: genralErrorMessage);
      result.fold(
          (failure) => emit(
                EditUserNameFailure(errorMessage: failure.errorMessage),
              ), (_) async {
        await homeRepo.updateUserNameAndUserImageInAllReviews(
          userName: userInfoEntity.name,
          userImage: null,
        );
        emit(
          EditUserNameSuccess(),
        );
      });
    }

    // update user email
    if (userInfoEntity.email != null && userInfoEntity.email!.isNotEmpty) {
      emit(EditUserEmailLoading());
      final result = await homeRepo.updateEmail(
          newEmail: userInfoEntity.email!,
          oldPassword: userInfoEntity.oldPassword!,
          genralErrorMessage: genralErrorMessage);
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
    if (userInfoEntity.newPassword != null &&
        userInfoEntity.newPassword!.isNotEmpty) {
      emit(EditUserPasswordLoading());
      final result = await homeRepo.updatePassword(
          newPassword: userInfoEntity.newPassword!,
          oldPassword: userInfoEntity.oldPassword!,
          genralErrorMessage: genralErrorMessage);
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
