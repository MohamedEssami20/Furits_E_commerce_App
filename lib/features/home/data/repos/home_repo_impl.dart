import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/storage_services.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';

import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DataBaseService dataBaseService;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final StorageServices storageServices;
  HomeRepoImpl({required this.dataBaseService, required this.storageServices});
  @override
  Stream<Either<Failure, UserEntity>> getUserData() async* {
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
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
        ),
      );
    }
  }

// implement uploadUserImage;
  @override
  Future<Either<Failure, String>> uploadUserImage({required File file}) async {
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
          errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى",
        ),
      );
    }
  }
}
