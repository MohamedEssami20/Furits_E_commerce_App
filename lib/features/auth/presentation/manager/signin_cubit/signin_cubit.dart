import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/failure.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required String genralErrorMessage}) async {
    emit(SigninLoading());
    Either<Failure, UserEntity> result =
        await authRepo.signInWithEmailAndPassword(
            email: email,
            password: password,
            genralErrorMessage: genralErrorMessage);
    result.fold(
      (failure) => emit(
        SigninFailure(errorMessage: failure.errorMessage),
      ),
      (success) => emit(
        SigninSuccess(userEntity: success),
      ),
    );
  }

  // create googel sign in function;

  Future<void> signInWithGoogle({required String genralErrorMessage}) async {
    emit(SigninLoading());
    Either<Failure, UserEntity> result =
        await authRepo.signInWithGoogle(genralErrorMessage: genralErrorMessage);
    result.fold(
      (failure) => emit(
        SigninFailure(errorMessage: failure.errorMessage),
      ),
      (success) => emit(
        SigninSuccess(userEntity: success),
      ),
    );
  }

  //create sigin with facebook function;
  Future<void> signInWithFacebook({required String genralErrorMessage}) async {
    emit(SigninLoading());
    Either<Failure, UserEntity> result = await authRepo.signInWithFacebook(
        genralErrorMessage: genralErrorMessage);
    result.fold(
      (failure) => emit(
        SigninFailure(errorMessage: failure.errorMessage),
      ),
      (success) => emit(
        SigninSuccess(userEntity: success),
      ),
    );
  }

  // cereate sign in with apple function;

  Future<void> signInWithApple({required String genralErrorMessage}) async {
    emit(SigninLoading());
    Either<Failure, UserEntity> result =
        await authRepo.signInWithApple(genralErrorMessage: genralErrorMessage);
    result.fold(
      (failure) => emit(
        SigninFailure(errorMessage: failure.errorMessage),
      ),
      (success) => emit(
        SigninSuccess(userEntity: success),
      ),
    );
  }
}
