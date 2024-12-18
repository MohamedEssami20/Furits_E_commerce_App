import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/constant/constant.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/shared_prefrence_sigelton.dart';
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
      Map<String, dynamic> userData =
          UserModel.formUserEntity(userEntity: userEntity).toMap();
      await dataBaseService.addData(
        path: BackendEndpoints.addUserData,
        data: userData,
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
      saveUserData(userEntity: userEntity);
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
      bool isDataExists = await dataBaseService.checkDataExists(
        path: BackendEndpoints.addUserData,
        documentId: user.uid,
      );
      if (isDataExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(userEntity: UserModel.fromFirebaseUser(user: user));
      }
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
  Future<void> addUserData(
      {required UserEntity userEntity, String? documnetId}) async {
    Map<String, dynamic> userData =
        UserModel.formUserEntity(userEntity: userEntity).toMap();
    await dataBaseService.addData(
      path: BackendEndpoints.addUserData,
      data: userData,
      documentId: documnetId!,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    Map<String, dynamic> data = await dataBaseService.getData(
        path: BackendEndpoints.addUsersData, documentId: uid);
    return UserEntity.fromMap(data);
  }

  @override
  Future<bool> isDataExists(
      {required String path, required String documentId}) async {
    return await dataBaseService.checkDataExists(
        path: path, documentId: documentId);
  }

  @override
  Future saveUserData({required UserEntity userEntity}) async {
    String jsonData =
        jsonEncode(UserModel.formUserEntity(userEntity: userEntity).toMap());
    await SharedPrefrenceSigelton.setString(kUserData, jsonData);
  }
}
