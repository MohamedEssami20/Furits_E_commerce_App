import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/features/home/domain/entities/edit_user_info_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entity/user_entity.dart';

abstract class HomeRepo {
  // create method that get user data from firebase
  Stream<Either<Failure, UserEntity>> getUserData();

  // create method that upload and update user image in firebase
  Future<Either<Failure, String>> uploadUserImage({required File file});

  // create method that update user data in firebase
  Future<Either<Failure, void>> updateUserEmail(
      {required EditUserInfoEntity userInfoEntity});

  // create method that change user password in firebase
  Future<Either<Failure, void>> updatePassword(
      {required EditUserInfoEntity userInfoEntity});
}
