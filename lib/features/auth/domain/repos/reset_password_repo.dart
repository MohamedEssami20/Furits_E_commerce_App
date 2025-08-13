import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, void>> sendCodeVerification(
      {required String email, required String code});
}
