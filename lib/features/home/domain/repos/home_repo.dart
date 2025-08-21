import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entity/user_entity.dart';

abstract class HomeRepo {

  // create method that get user data from firebase
  Stream<Either<Failure, UserEntity>> getUserData();

  // create method that upload and update user image in firebase
  Future<Either<Failure, String>> uploadUserImage({required File file});
}