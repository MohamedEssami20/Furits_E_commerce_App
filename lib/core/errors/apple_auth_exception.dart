import 'package:fruits_hub/core/errors/failure.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthExceptionsHandler extends Failure {
  AppleAuthExceptionsHandler({required super.errorMessage});

  factory AppleAuthExceptionsHandler.fromSignInWithAppleException(
          SignInWithAppleException exception) =>
      AppleAuthExceptionsHandler(errorMessage: getErrorKey(exception));
  static String getErrorKey(SignInWithAppleException exception) {
    if (exception is SignInWithAppleNotSupportedException) {
      return 'apple_not_supported';
    }

    if (exception is SignInWithAppleAuthorizationException) {
      switch (exception.code) {
        case AuthorizationErrorCode.canceled:
          return 'apple_canceled';
        case AuthorizationErrorCode.failed:
          return 'apple_failed';
        case AuthorizationErrorCode.invalidResponse:
          return 'apple_invalid_response';
        case AuthorizationErrorCode.notHandled:
          return 'apple_not_handled';
        case AuthorizationErrorCode.notInteractive:
          return 'apple_not_interactive';
        case AuthorizationErrorCode.unknown:
          return 'apple_unknown';
      }
    }

    if (exception is SignInWithAppleCredentialsException) {
      return 'apple_credentials_error';
    }

    if (exception is UnknownSignInWithAppleException) {
      return 'apple_unknown';
    }

    return 'apple_unknown'; // fallback
  }
}
