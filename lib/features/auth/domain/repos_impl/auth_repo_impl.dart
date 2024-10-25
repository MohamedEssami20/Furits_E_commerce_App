import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImpl(
      {required this.dataBaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      UserEntity userEntity =
          UserEntity(email: user.email!, userName: name, uid: user.uid);
      await dataBaseService.addData(
        path: BackendEndpoints.addUserData,
        data: userEntity.toMap(),
        documentId: user.uid,
      );
      return right(
        userEntity,
      );
    } on CustomException catch (error) {
      await deleteUser(user);
      return left(
        ServerFailure(errorMessage: error.errorMessage),
      );
    } catch (error) {
      deleteUser(user);
      log("Exception in auth repo impl= ${error.toString()}");
      return left(
        ServerFailure(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      User user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      log("user id= ${user.uid.toString()}");
      UserEntity userEntity = await getUserData(uid: user.uid);
      log("user entity= ${userEntity.toString()}");

      return right(
        userEntity,
      );
    } on CustomException catch (error) {
      return left(
        ServerFailure(errorMessage: error.errorMessage),
      );
    } catch (error) {
      log("Exception in auth repo impl signin= ${error.toString()}");
      return left(
        ServerFailure(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebaseUser(user: user),
      );
    } on CustomException catch (error) {
      deleteUser(user);
      return left(
        ServerFailure(errorMessage: error.errorMessage),
      );
    } catch (error) {
      log("Exception in auth repo impl signin= ${error.toString()}");
      return left(
        ServerFailure(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      return right(
        UserModel.fromFirebaseUser(user: user),
      );
    } on CustomException catch (error) {
      deleteUser(user);
      return left(
        ServerFailure(errorMessage: error.errorMessage),
      );
    } catch (error) {
      log("Exception in auth repo impl signin= ${error.toString()}");
      return left(
        ServerFailure(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      return right(
        UserModel.fromFirebaseUser(user: user),
      );
    } on CustomException catch (error) {
      deleteUser(user);
      return left(
        ServerFailure(errorMessage: error.errorMessage),
      );
    } catch (error) {
      log("Exception in auth repo impl signin= ${error.toString()}");
      return left(
        ServerFailure(
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
        ),
      );
    }
  }

  @override
  Future<void> addUserData({required UserEntity userEntity, String? documnetId}) async {
    await dataBaseService.addData(
      path: BackendEndpoints.addUserData,
      data: userEntity.toMap(),
      documentId: documnetId!,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    Map<String, dynamic> data = await dataBaseService.getData(
        path: BackendEndpoints.addUsersData, documentId: uid);
    return UserEntity.fromMap(data);
  }
}
