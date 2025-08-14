part of 'reset_password_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}

// create all state of send code verification
final class SendCodeVerificationLoading extends ResetPasswordState {}

final class SendCodeVerificationSuccess extends ResetPasswordState {}

final class SendCodeVerificationFailure extends ResetPasswordState {
  final String errorMessage;
  const SendCodeVerificationFailure({required this.errorMessage});
}

// create all state of check verification code;
final class CheckVerificationCodeLoading extends ResetPasswordState {}

final class CheckVerificationCodeSuccess extends ResetPasswordState {}

final class CheckVerificationCodeFailure extends ResetPasswordState {
  final String errorMessage;
  const CheckVerificationCodeFailure({required this.errorMessage});
}
