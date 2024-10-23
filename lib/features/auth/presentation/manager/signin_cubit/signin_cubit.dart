import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SigninLoading());
    Either<Failure, UserEntity> result = await authRepo
        .signInWithEmailAndPassword(email: email, password: password);
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

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    Either<Failure, UserEntity> result = await authRepo.signInWithGoogle();
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
  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    Either<Failure, UserEntity> result = await authRepo.signInWithFacebook();
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

  Future<void> signInWithApple() async {
    emit(SigninLoading());
    Either<Failure, UserEntity> result = await authRepo.signInWithApple();
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
