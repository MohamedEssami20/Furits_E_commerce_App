import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entity/user_entity.dart';

abstract class HomeRepo {
  // create method that get user data from firebase
  Stream<Either<Failure, UserEntity>> getUserData();

  // create method that upload and update user image in firebase
  Future<Either<Failure, String>> uploadUserImage({required File file});

  // create method that update user name data in firebase;
  Future<Either<Failure, void>> updateName({required String name});


  // create method that update email data in firebase
  Future<Either<Failure, void>> updateEmail(
      {required String newEmail, required String oldPassword});

  // create method that change user password in firebase
  Future<Either<Failure, void>> updatePassword(
      {required String newPassword, required String oldPassword});

  // create method that sign out from firebase
  Future<void> signOut();

}
