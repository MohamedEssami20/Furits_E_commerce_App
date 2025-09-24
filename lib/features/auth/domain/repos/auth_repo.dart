import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String genralErrorMessage});

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required String genralErrorMessage});

  Future<Either<Failure, UserEntity>> signInWithGoogle(
      {required String genralErrorMessage});

  Future<Either<Failure, UserEntity>> signInWithFacebook(
      {required String genralErrorMessage});

  Future<Either<Failure, UserEntity>> signInWithApple(
      {required String genralErrorMessage});

  Future<void> addUserData(
      {required UserEntity userEntity, String? documnetId});

  Future<UserEntity> getUserData({required String uid});

  Future<bool> isDataExists({required String path, required String documentId});

  Future<void> saveUserData({required UserEntity userEntity});
}
