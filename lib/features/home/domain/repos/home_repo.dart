import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entity/user_entity.dart';

abstract class HomeRepo {

  // create method that get user data from firebase
  Future<Either<Failure, UserEntity>> getUserData({required String uid});
}