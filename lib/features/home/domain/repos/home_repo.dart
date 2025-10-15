import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entity/user_entity.dart';

abstract class HomeRepo {
  // create method that get user data from firebase
  Stream<Either<Failure, UserEntity>> getUserData(
      {required String genralErrorMessage});

  // create method that upload and update user image in firebase
  Future<Either<Failure, String>> uploadUserImage(
      {required File file, required String genralErrorMessage});

  // create method that update user name data in firebase;
  Future<Either<Failure, void>> updateName(
      {required String name, required String genralErrorMessage});

  // create method that update email data in firebase
  Future<Either<Failure, void>> updateEmail(
      {required String newEmail,
      required String oldPassword,
      required String genralErrorMessage});

  // create method that change user password in firebase
  Future<Either<Failure, void>> updatePassword(
      {required String newPassword,
      required String oldPassword,
      required String genralErrorMessage});

  // create method that sign out from firebase
  Future<Either<Failure, void>> signOut({required String genralErrorMessage});

  // create method that get user orders from firebase
  Stream<Either<Failure, List<MyOrdersEntity>>> getUserOrders(
      {required String genralErrorMessage});

  // create method that update username and user image in all reviews when user update username or image;
  Future<Either<Failure, void>> updateUserNameAndUserImageInAllReviews(
    {
      required String? userName,
      required String? userImage
    } 
  );
}
