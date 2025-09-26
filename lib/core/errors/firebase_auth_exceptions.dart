import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/failure.dart';

class FirebaseAuthErrorHandler extends Failure {
  FirebaseAuthErrorHandler({required super.errorMessage});

  // create factory constructor that returns an instance of the class;
  factory FirebaseAuthErrorHandler.fromFirebaseAuthException(
          FirebaseAuthException e) =>
      FirebaseAuthErrorHandler(
        errorMessage: getErrorMessage(e),
      );
  static String getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-mismatch':
        return "auth_userMismatch";
      case 'user-not-found':
        return "auth_userNotFound";
      case 'email-already-in-use':
        return "auth_emailAlreadyInUse";
      case 'invalid-credential':
        return "auth_invalidCredential";
      case 'invalid-email':
        return "auth_invalidEmail";
      case 'wrong-password':
        return "auth_wrongPassword";
      case 'invalid-verification-code':
        return "auth_invalidVerificationCode";
      case 'invalid-verification-id':
        return "auth_invalidVerificationId";
      case 'requires-recent-login':
        return "auth_requiresRecentLogin";
      case 'missing-android-pkg-name':
        return "auth_missingAndroidPkgName";
      case 'missing-continue-uri':
        return "auth_missingContinueUri";
      case 'missing-ios-bundle-id':
        return "auth_missingIosBundleId";
      case 'invalid-continue-uri':
        return "auth_invalidContinueUri";
      case 'unauthorized-continue-uri':
        return "auth_unauthorizedContinueUri";
      default:
        return "auth_unexpectedError";
    }
  }
}
