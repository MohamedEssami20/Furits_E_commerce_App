import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

part 'signup_user_state.dart';

class SignupUserCubit extends Cubit<SignupUserState> {
  SignupUserCubit(this.authRepo) : super(SignupUserInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name, required String genralErrorMessage}) async {
    emit(SignupUserLoading());
    Either<Failure, UserEntity> result =
        await authRepo.createUserWithEmailAndPassword(
            email: email, password: password, name: name, genralErrorMessage: genralErrorMessage);
    result.fold(
      (failure) => emit(
        SignupUserFailure(errorMessage: failure.errorMessage),
      ),
      (success) => emit(
        SignupUserSuccess(userEntity: success),
      ),
    );
  }
}
