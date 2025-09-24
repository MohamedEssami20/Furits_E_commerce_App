import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/errors/firebase_auth_exceptions.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/storage_services.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';

import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_entity.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../../checkout/data/models/order_model.dart';
import '../../domain/entities/edit_user_info_entity.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DataBaseService dataBaseService;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final StorageServices storageServices;
  HomeRepoImpl({required this.dataBaseService, required this.storageServices});
  @override
  Stream<Either<Failure, UserEntity>> getUserData(
      {required String genralErrorMessage}) async* {
    try {
      Stream<Map<String, dynamic>> data = dataBaseService.getStreamData(
        path: BackendEndpoints.addUsersData,
        documentId: firebaseAuthService.getCurrentUser()!,
      );
      await for (var element in data) {
        UserEntity user = UserModel.fromJson(element);
        yield right(user);
      }
    } on FirebaseException catch (e) {
      log("error to get user data 1 = ${e.message.toString()}");
      yield left(
        ServerFailure(
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      log("error to get user data 2 = ${e.toString()}");
      yield left(
        ServerFailure(
          errorMessage: genralErrorMessage,
        ),
      );
    }
  }

// implement uploadUserImage;
  @override
  Future<Either<Failure, String>> uploadUserImage(
      {required File file, required String genralErrorMessage}) async {
    try {
      final String result = await storageServices.addPhotoToStorage(
        file: file,
        path: BackendEndpoints.userImages,
      );
      log("image upload url = $result");
      // add new user image path to firestore;
      if (result.isNotEmpty) {
        await dataBaseService.addData(
          path: BackendEndpoints.addUsersData,
          documentId: firebaseAuthService.getCurrentUser()!,
          data: {
            "image": BackendEndpoints.baseImageUrl + result,
          },
        );
      }
      return right(BackendEndpoints.baseImageUrl + result);
    } on FirebaseException catch (e) {
      log("error to upload image to storage = ${e.message.toString()}");
      return left(
        ServerFailure(
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      log("error to upload image to storage 2 = ${e.toString()}");
      return left(
        ServerFailure(
          errorMessage: genralErrorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateEmail(
      {required String newEmail,
      required String oldPassword,
      required String genralErrorMessage}) async {
    try {
      await updateEmailandSaveInFireStore(
        EditUserInfoEntity(email: newEmail, oldPassword: oldPassword),
      );
      await firebaseAuthService.signOut();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(
        FirebaseAuthErrorHandler.fromFirebaseAuthException(e),
      );
    } on FirebaseException catch (e) {
      log("error to update user email = ${e.message.toString()}");
      return left(
        ServerFailure(
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      log("error to update user email 2 = ${e.toString()}");
      return left(
        ServerFailure(
          errorMessage: genralErrorMessage,
        ),
      );
    }
  }

  Future<void> updateEmailandSaveInFireStore(
      EditUserInfoEntity userInfoEntity) async {
    // reauth and update email from firebase;
    String? email = firebaseAuthService.getCurrentUserEmail();
    log("current user email= $email");
    await firebaseAuthService.reAuth(
      email: email!,
      password: userInfoEntity.oldPassword!,
    );
    await firebaseAuthService.updateEmail(email: userInfoEntity.email!);
    await dataBaseService.addData(
      path: BackendEndpoints.addUsersData,
      documentId: firebaseAuthService.getCurrentUser()!,
      data: {
        "email": userInfoEntity.email,
      },
    );
  }

  @override
  Future<Either<Failure, void>> updatePassword(
      {required String newPassword,
      required String oldPassword,
      required String genralErrorMessage}) async {
    try {
      await firebaseAuthService.reAuth(
        email: firebaseAuthService.getCurrentUserEmail()!,
        password: oldPassword,
      );
      await firebaseAuthService.updatePassword(newPassword: newPassword);
      await firebaseAuthService.signOut();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthErrorHandler.fromFirebaseAuthException(e));
    } on FirebaseException catch (e) {
      log("error to update user password = ${e.message.toString()}");
      return left(ServerFailure(errorMessage: e.message.toString()));
    } catch (e) {
      log("error to update user password 2 = ${e.toString()}");
      return left(ServerFailure(errorMessage: genralErrorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> signOut(
      {required String genralErrorMessage}) async {
    try {
      await firebaseAuthService.signOut();
      return right(null);
    } on FirebaseException catch (e) {
      log("error to sign out = ${e.toString()}");
      return left(
        ServerFailure(
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      log("error to sign out 2 = ${e.toString()}");
      return left(
        ServerFailure(
          errorMessage: genralErrorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateName(
      {required String name, required String genralErrorMessage}) async {
    try {
      await dataBaseService.addData(
        path: BackendEndpoints.addUsersData,
        documentId: firebaseAuthService.getCurrentUser()!,
        data: {
          "userName": name,
        },
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("error to update user name data = ${e.message.toString()}");
      return left(ServerFailure(errorMessage: e.message.toString()));
    } catch (e) {
      log("error to update user name data 2 = ${e.toString()}");
      return left(
          ServerFailure(errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى"));
    }
  }

  @override
  Stream<Either<Failure, List<MyOrdersEntity>>> getUserOrders(
      {required String genralErrorMessage}) async* {
    try {
      Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> data =
          dataBaseService.getStreamDataWithDocumentId(
              mainPath: BackendEndpoints.addOrder,
              subPath: BackendEndpoints.addUserOrders,
              documentId: firebaseAuthService.getCurrentUser()!,
              query: {
            "descending": true,
          });
      await for (var element in data) {
        final orders = element
            .map((order) => OrderModel.fromJson(order.data()).toEntity())
            .toList();
        yield right(orders);
      }
    } on FirebaseException catch (e) {
      log("error to get user orders = ${e.message.toString()}");
      yield left(ServerFailure(errorMessage: e.message.toString()));
    } catch (e) {
      log("error to get user orders 2 = ${e.toString()}");
      yield left(ServerFailure(errorMessage: genralErrorMessage));
    }
  }
}
