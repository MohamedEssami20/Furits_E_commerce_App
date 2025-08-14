import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/repos/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.resetPasswordRepo})
      : super(ResetPasswordInitial());

  final ResetPasswordRepo resetPasswordRepo;

  Future<void> sendCodeVerification(
      {required String email, required int code}) async {
    emit(SendCodeVerificationLoading());
    final result =
        await resetPasswordRepo.sendCodeVerification(email: email, code: code);
    result.fold(
      (l) => emit(
        SendCodeVerificationFailure(errorMessage: l.errorMessage),
      ),
      (r) => emit(
        SendCodeVerificationSuccess(),
      ),
    );
  }

  // create method that check verification code
  Future<void> checkVerificationCode(
      {required int code, required String email}) async {
    emit(CheckVerificationCodeLoading());
    final result =
        await resetPasswordRepo.checkVerificationCode(code: code, email: email);
    result.fold(
      (l) => emit(
        CheckVerificationCodeFailure(errorMessage: l.errorMessage),
      ),
      (r) => emit(
        CheckVerificationCodeSuccess(),
      ),
    );
  }
}
