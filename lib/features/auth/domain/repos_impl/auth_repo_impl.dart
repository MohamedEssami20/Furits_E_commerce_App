import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      User user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user: user),
      );
    } on CustomException catch (error) {
      return left(
        ServerFailure(errorMessage: error.errorMessage),
      );
    } catch (error) {
      return left(
        ServerFailure(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}