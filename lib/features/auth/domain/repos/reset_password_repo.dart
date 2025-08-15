import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, void>> sendCodeVerification(
      {required String email, required int code});

// create method that check verification code
  Future<Either<Failure, void>> checkVerificationCode(
      {required int code, required String email});

// create method that send email to reset password with email;
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
}
